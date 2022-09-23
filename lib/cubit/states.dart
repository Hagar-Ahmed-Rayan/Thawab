
abstract class appStates {}

class appInitialState extends appStates {}
class AppChangeBottomNavState extends appStates {}
class readjsonLoding extends appStates {}
class readjsonSuccessful extends appStates {}


class readjesonErrorState extends appStates
{
  final dynamic error;

  readjesonErrorState(this.error);
}
class readazkarjsonLoding extends appStates {}
class readazkarjsonSuccessful extends appStates {}


class readazkarjesonErrorState extends appStates
{
  final dynamic error;

  readazkarjesonErrorState(this.error);
}
////time>1
class timegraterthanone extends appStates{}
class timegraterthanoneerror extends appStates{}
//change mood

class changemoodstate extends appStates{}

//change notfi
class changenotificationstate extends appStates{}
