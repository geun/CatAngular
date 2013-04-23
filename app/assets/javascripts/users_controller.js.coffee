root = global ? window

UsersIndexCtrl = ($scope, $resource) ->
  User = $resource("/users/:id", {id: @id},{update: {method: "PUT"}})
  $scope.users = User.query()

  $scope.destory = ->
    if confirm("Are you sure?")
      original = @user
      @user.destory ->
        $scope.users = _.without($scope.users, original)

UsersIndexCtrl.$inject = ['$scope', '$resource']


root.UsersIndexCtrl = UsersIndexCtrl


