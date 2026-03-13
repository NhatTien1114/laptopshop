<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Delete ${id}</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
            </head>

            <body>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-10 col-12 mx-auto">
                            <h1>Delete a User with ID = ${id}</h1>
                            <hr>
                            <div class="alert alert-danger" role="alert">
                                Xác nhận xóa user có id: ${id}
                            </div>
                            <form:form method="post" action="/admin/user/delete" modelAttribute="userDelete">
                                <div class="mb-3" style="display: none">
                                    <label class="form-label">ID:</label>
                                    <form:input value="${id}" type="text" class="form-control" path="id" />
                                </div>
                                <button class="btn btn-danger">Delete</button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </body>

            </html>