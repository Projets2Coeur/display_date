require_relative '../vendor/github_downloader'
require 'yaml'
require 'fileutils'
require 'dotenv'
Dotenv.load

class LocalesDownloader

  LOCALES_DIR = 'lib/config/locales/rails'

  class << self

    def call
      remove_all_locales
      fetch_latest_locales_from_rails_i18n_repo
      remove_everything_not_related_to_date_and_time_from_locale_files
    end

  private

    def remove_all_locales
      FileUtils.rm_rf Dir.glob("#{LOCALES_DIR}/**/*")
    end

    def fetch_latest_locales_from_rails_i18n_repo
      GitHubDownloader.download_directory(
        ENV['GITHUB_API_TOKEN'],
        {
          repo_name: 'rails-i18n',
          repo_owner: 'svenfuchs',
          path: 'rails/locale'
        },
        LOCALES_DIR
      )
    end

    def remove_everything_not_related_to_date_and_time_from_locale_files
      Dir["#{LOCALES_DIR}/**/*"].each do |locale_file|
        next if File.directory?(locale_file)
        original_hash = YAML.load(File.read(locale_file))
        language = original_hash.keys.first
        translation_hash = { language => {} }
        translation_hash[language]["date"] = original_hash[language]["date"]
        translation_hash[language]["time"] = original_hash[language]["time"]
        File.open(locale_file, 'w') do |f|
          f << translation_hash.to_yaml
        end
      end
    end

  end

end
