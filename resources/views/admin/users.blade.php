@extends('_admin_layout')
@section('content')
<style>
    #abuttonv a {
            background-color: #fff;
            border: 1px solid #ddd;
            box-sizing: border-box;
            color: FFC800;
            cursor: pointer;
            display: inline-block;
            font-family: din-round,sans-serif;
            font-size: 15px;
            font-weight: 700;
            padding: 10px 12px;
            text-align: center;
            width: 100%;
        }
    #abuttonv ul {
        margin-left: 35%;
    } 
</style>
<div ng-app="myapp" ng-controller="mycontroller">
    <h1 class="text-center">Quản lí tài khoản</h1>
    <button type="button" class="btn btn-primary" ng-click="editClick(0)">Thêm tài khoản</button>
    <p class="text-center">Tìm kiếm: <input type="text" ng-model='q'></p>
                <table class="table table-bordered table-stripper">
                    <thead>
                        <tr>
                            <th>TT</th>
                            <th>Họ tên</th>
                            <th>Tài khoản</th>
                            <th>Email</th>
                            <th>Mật khẩu</th>
                            <th>Số điện thoại</th>
                            <th>Địa chỉ</th>
                            <th>Ảnh</th>
                            <th>Remember_token</th>
                            <th>Sửa</th>
                            <th>Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr dir-paginate = "u in users |filter: q| itemsPerPage: pageSize" current-page="currentPage">
                            <td>@{{$index+1+(currentPage-1)*pageSize}}</td>
                            <td>@{{ u.full_name }}</td>
                            <td>@{{ u.users_name }}</td>
                            <td>@{{ u.email}}</td>
                            <td>@{{ u.password }}</td>                           
                            <td>@{{ u.phone}}</td>
                            <td>@{{ u.address}}</td>
                            <td><img src="/upload/images/users/@{{u.image}}" style='width:100px;height:100px' alt=""></td>
                            <td>@{{ u.remember_token}}</td>

                            <td><button class="btn btn-info" ng-click="editClick(u.id)"><i class="fas fa-edit"></i></button></td>
                            <td><button class="btn btn-danger" ng-click="deleteClick(u.id)"><i class="fas fa-trash-alt"></i></button></td>
                        </tr>
                    </tbody>
                </table>
                <dir-pagination-controls max-size='5' id="abuttonv" on-page-change="pageChangeHandler(newPageNumber)"></dir-pagination-controls>

    <!-- Modal -->
    <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 600px;">
            <div class="modal-content">
                    <div class="modal-header">
                            <h5 class="modal-title">@{{modaltitle}}</h5>
                                <button type="button" class="close" ng-click="modalHide()" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                        </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label">Họ tên</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" id="name" ng-model="users.full_name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label">Tài khoản</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" id="name" ng-model="users.users_name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label">Mật khẩu</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" id="name" ng-model="users.password">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label">Email</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" id="name" ng-model="users.email">
                            </div>
                        </div>
                          <div class="form-group row">
                            <label for="description" class="col-sm-3 col-form-label">Số điện thoại</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="name" ng-model="users.phone">
                            </div>
                          </div>
                          <div class="form-group row">
                            <label for="description" class="col-sm-3 col-form-label">Địa chỉ</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="name" ng-model="users.address">
                            </div>
                          </div>
                          <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label">Ảnh:</label>
                            <div class="col-sm-6">
                                <input type="file" class="form-control " id="file-upload" ng-model="users.image">
                            </div>
                            </br>
                            <div style="width:100px;height:100px" id="image" class="col-sm-3">
                                <img src="/upload/images/users/@{{sp.image}}" alt="Ảnh" style="width:100%;height:100%" ng-model="u.image">
                            </div>
                        </div> 
                          <div class="form-group row">
                            <label for="description" class="col-sm-3 col-form-label">Remember_token</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="name" ng-model="users.remember_token">
                            </div>
                        </div>  
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" ng-click="modalHide()">Đóng</button>
                    <button type="button" class="btn btn-primary" ng-click="updateData()">Lưu</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $('#exampleModal').on('show.bs.modal', event => {
            var button = $(event.relatedTarget);
            var modal = $(this);
            // Use above variables to manipulate the DOM
        });
    </script>
    <script src="/js/angular.min.js"></script>
    <script src="/js/users.js"></script>   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://rawgit.com/michaelbromley/angularUtils-pagination/master/dirPagination.js"></script>
</div>

@stop