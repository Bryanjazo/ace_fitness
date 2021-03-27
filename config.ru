require './config/environment'

use Rack::MethodOverride

use SessionController
use WorkoutController
use UserController
run ApplicationController
