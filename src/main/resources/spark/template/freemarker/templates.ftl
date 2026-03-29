<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Andrea Cimmino">

    <title>Publisher</title>
    <link href="https://oeg-upm.github.io/helio-publisher/src/main/resources/static/css/favicons/helio-favicon-32x32.png" rel="shortcut icon" type="image/png">

    <#include "./fragments/css-imports.ftl"/>
  </head>

  <body>
    
  <#include "./fragments/navbar.html"/>

  <div class="container-fluid">
    <div class="row">

      <#include "./fragments/sidebar.html"/>
      
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">HTML Views</h1>
          <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group me-2">
              <button type="button" class="btn btn-sm btn-outline-success" id="addNewEndpoint" data-bs-toggle="modal" data-bs-target="#editModal">
                <i class="bi bi-plus-circle"></i> Add
              </button>
            </div>
          </div>
        </div>

        <div class="table-responsive">
          <table class="table table-striped align-middle" id="dtBasicExample">
            <thead>
              <tr style="text-align:center;">
                <th class="th-sm" style="text-align:center;">Template</th>
                <th class="th-sm" style="text-align:center;">Renderer</th>
                <th class="th-sm" style="text-align:center;">#</th>
              </tr>
            </thead>
            <tbody id="tableBody">
              <#list views as view>
                <tr style="text-align: center;">
                  <td>${view.template}</td>
                  <td>${view.render.@type}</td>
                  <td>
                    <button type="button" class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#editModal" id="openEditModal" onclick="editObject('${view.id}')" style="margin-right:5px">
                      <i class="bi bi-pencil-fill"></i>
                    </button>
                    <button onclick="deleteRow('${view.id}')" type="button" class="btn btn-sm btn-danger">
                      <i class="bi bi-trash3-fill"></i>
                    </button>
                  </td>
                </tr>
              <#else>
                <tr style="text-align: center;">
                  <td>No data :(</td>
                  <td></td>
                  <td></td>
                </tr>
              </#list>
            </tbody>
          </table>
        </div>

        <#include "./fragments/toasts.html"/>
        
      </main>
    </div>
  </div>

  <#include "./fragments/js-imports.ftl"/>

  <!-- MODALS -->
  <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="editModalLabel">View's data</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>

        <div class="modal-body">
          <form id="inputForm" enctype="multipart/form-data">
            <div class="form-group">
              <input type="text" class="form-control" id="id" name="id" style="display: none;">

              <label for="templateFile">Template</label>
              <input type="file" class="form-control" id="templateFile" name="templateFile" aria-describedby="nameHelp" accept=".ftl,.vm,.html,.htm">
              <small id="nameHelp" class="form-text text-muted">
                Select a local template file to upload to the server.
              </small>
            </div>

            <div class="form-group mt-3">
              <label for="render">HTML renderers:</label>
              <select class="form-select" id="render" name="render">
                <option value="1" class="selected disabled">Freemarker</option>
                <option value="2">Velocity</option>
              </select>
            </div>
          </form>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeModal">Close</button>
          <button type="button" class="btn btn-primary" onclick="updateRow()">Save</button>
        </div>
      </div>
    </div>
  </div>
  <!-- /Add modal-->

  </body>
</html>

<script>
  var base_domain = "/api/views";

  $(document).ready(function(){
    $("#menu_templates").addClass('active');
  });

  $(document).ready(function () {
    $('#dtBasicExample').DataTable({
      "order": [[0, 'desc']],
      "pagingType": "simple",
      "searching": true
    });
    $('.dataTables_length').addClass('bs-select');
  });

  $('#editModal').on('shown.bs.modal', function (e) {
    console.log("Opened modal");
  });

  function updateRow() {
    const id = $("#id").val();
    const render = $("#render").val();
    const fileInput = $("#templateFile")[0];

    const formData = new FormData();
    formData.append("id", id);
    formData.append("render", render);

    if (fileInput.files.length > 0) {
      formData.append("templateFile", fileInput.files[0]);
    }

    const method = id ? "PUT" : "POST";
    const url = id ? base_domain + "/" + id : base_domain;

    $.ajax({
      url: url,
      type: method,
      data: formData,
      processData: false,
      contentType: false,
      success: function(response) {
        console.log("Upload successful");
        location.reload();
      },
      error: function(xhr, status, error) {
        console.error("Upload error:", error);
        alert("Error uploading file");
      }
    });
  }
</script>