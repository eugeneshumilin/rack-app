class TimeHandler
  attr_reader :valid, :unknown

  FORMATS = { 'year' => '%Y-', 'month' => '%m-', 'day' => '%d ',
              'hour' => '%H:', 'minute' => '%M:', 'second' => '%S' }.freeze

  def initialize(params)
    @valid = ''
    @unknown = []
    time_output(params['format'].split(','))
  end

  private

  def time_output(params)
    params.each do |format|
      if FORMATS[format]
        @valid += FORMATS[format]
      else
        @unknown << format
      end
    end
  end
end
