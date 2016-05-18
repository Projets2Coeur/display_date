require 'display_date/version'
require 'i18n'

I18n.load_path = Dir['config/locales/**/*.yml']
I18n.backend.load_translations

class DisplayDate

  def initialize(d1, d2 = nil)
    @d1 = d1
    @d2 = d2
  end

  def as_date
    join do
      if d2.nil? || same_day?
        [on, date(d1)]
      else
        [ from, date(d1),
            to, date(d2) ]
      end
    end
  end

  def as_datetime
    join do
      if d2
        if same_day?
          [   on, date(d1),
            from, time(d1),
              to, time(d2) ]
        else
          [ from, date(d1),
              at, time(d1),
              to, date(d2),
              at, time(d2) ]
        end
      else
        [ on, date(d1),
          at, time(d1) ]
      end
    end
  end

private

  attr_accessor :d1, :d2

  def date(d)
    I18n.localize(d.to_date, format: :long)
  end

  def time(t)
    t.strftime("%H:%M")
  end

  def same_day?
    d1.to_date.eql?(d2.to_date)
  end

  def join
    yield.join(' ')
  end

  def on;   I18n.t('date_display.date_on');   end
  def from; I18n.t('date_display.date_from'); end
  def to;   I18n.t('date_display.date_to');   end
  def at;   I18n.t('date_display.date_at');   end

end
