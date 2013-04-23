root = global ? window

UsersIndexCtrl = ($scope, User) ->

  $scope.users = User.query()

  $scope.addUser = ->
    $scope.users.push($scope.newUser)
    $scope.newUser = {}

  $scope.drawWinner = ->
    pool = []

    if $scope.users.length >0
      angular.forEach $scope.users, (user) ->
        pool.push(user) if !user.winner

      if pool.length > 0
        user = pool[Math.floor(Math.random() * pool.length)]
        user.winner = true
        $scope.lastWinner = user

UsersIndexCtrl.$inject = ['$scope', 'User']

UsersShowCtrl = ($scope, $location, $routeParams, User) ->
  User.get
    id: $routeParams.id
    , (post) ->
      @original = post
      $scope.user = new User(@original)

  $scope.destory = ->
    if confirm("Are you sure?")
      $scope.user.destory ->
        $location.path "/users"

UsersShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'User']


#exports
root.UsersIndexCtrl = UsersIndexCtrl
root.UsersShowCtrl = UsersShowCtrl