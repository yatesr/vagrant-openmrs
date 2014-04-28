# import other classes in dir
import "classes/*"

# Variables
$dbname = 'openmrs'
$dbuser = 'openmrs_user'
$dbpwd = "openmrspass1"
$dbrootpwd = "openmrsrootpass1"
$openmrsVersion = '1.9.7'

node default {
  include java
  include omrsdb 
  include tomcat
  include openmrs
}
