require_relative 'middleware/check_path'
require_relative 'app'

use CheckPath
run App.new
