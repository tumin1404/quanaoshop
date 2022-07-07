var app = angular.module('myapp',['angularUtils.directives.dirPagination']);
app.controller('mycontroller', function($scope, $http) {
    $scope.q="";
    var api = 'http://127.0.0.1:8000/api/userss/';
    var loadData = function(){
        $http({
            method:'GET',
            url:api
        }).then(function(res){
            $scope.users = res.data;
            console.log(res.data);
        });
    }
    loadData();
    $scope.modalHide = function(){
        $('#modelId').modal('hide');
    }
    $scope.editClick = function(id) {
        $scope.id = id;
        if (id == 0) {
            $scope.modalTitle = "Thêm mới loại sản phẩm";
            
            if ($scope.users) {
                delete $scope.users;
            }
           
        } else {
            $scope.modalTitle = "Sửa loại sản phẩm";
            $http({
                Method: "GET",
                url: "http://127.0.0.1:8000/api/userss/" + id
            }).success(function(response) {
                $scope.users = response;
            });
        }
        $('#modelId').modal('show');
    }
    $scope.updateData = function() {
        var mt = $scope.id==0?"POST":"PUT";
        var url1 = $scope.id==0?"http://127.0.0.1:8000/api/userss/":"http://127.0.0.1:8000/api/userss/"+$scope.id;
        alert($scope.users.tenloai);
        $http({
            method: mt,
            url: url1,
            data: $scope.users,
           'Content-Type': 'application/json'
        }).success(function(response) {
            console.log(response);
            $('#modelId').modal('hide');
            $scope.loaddata();
        });
        location.reload();
    }
    
    $scope.deleteClick = function(id) {
        var hoi = confirm('Bạn có muốn xóa loại sản phẩm này không?');
        if (hoi) {
            $http({
                method: "DELETE",
                url: "http://127.0.0.1:8000/api/userss/" + id,
                data: $scope.users,
            }).then(function(res) {
                $scope.message = res.data;
                $scope.loaddata();
            });
        }
    }

    $scope.saveData = function() {
        var m = $scope.id == 0 ? "POST" : "PUT";
        var url = $scope.id == 0 ? "http://127.0.0.1:8000/api/userss/" : "http://127.0.0.1:8000/api/userss/" + $scope.id;
        $http({
            method: m,
            url: url,
            data: $scope.users,
            'content-Type': 'application/json'
        }).then(function(res) {
            $scope.users == res.data;
        }, err => console.log(err));
        $('#modelId').modal('hide');
        $scope.loaddata();
        location.reload();
    }

    
    $scope.currentPage = 1;
    $scope.pageChangeHandler = function(num) {
            $scope.currentPage = num;
        };
    $scope.pageSize = 5;


    
    //thêm ảnh
    const fileUpload = document.querySelector("#file-upload");
    fileUpload.addEventListener("change", (e) => {
    const files = e.target.files;
    document.getElementById('image').innerHTML = `<img src="/upload/images/users/`+ files[0].name +`" alt="Ảnh" style="width:100%;height:100%">`;
    for(const file of files) {
    const {name, type, size, lastModified } = file;
    // Làm gì đó với các thông tin trên
    $scope.users.image = file.name;
    document.getElementById('image').innerHTML = `<img src="/upload/images/users/`+ file.name +`" alt="Ảnh" style="width:100%;height:100%">`;
    };
    });
});