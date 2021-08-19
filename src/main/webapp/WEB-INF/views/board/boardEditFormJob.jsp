<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<!-- summernote -->
<link rel="stylesheet"
	href="/codemoa/resources/plugins/summernote/summernote-bs4.min.css">
<!-- CodeMirror -->
<link rel="stylesheet"
	href="/codemoa/resources/plugins/codemirror/codemirror.css">
<link rel="stylesheet"
	href="/codemoa/resources/plugins/codemirror/theme/monokai.css">
<!-- SimpleMDE -->
<link rel="stylesheet"
	href="/codemoa/resources/plugins/simplemde/simplemde.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>

</style>
</head>
<body>
	<c:import url="../common/menu.jsp" />
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
							<h1 style="text-align:center;">게시글 작성하기</h1>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-outline card-info" style="width: 80%;">
							<!-- /.card-header -->
							<div class="card-body">
        <br><input type="text" class="form-control" placeholder="제목을 입력하세요"><br>
								<textarea id="summernote">
                                       자금세탁된 100억만 딱 통장에 꽂아주십쇼
                                    </textarea>
								<input type="text" class="form-control" placeholder="태그를 입력하세요"><br>    <br>
															 <div class="col-12 col-md-12 col-lg-8 order-2 order-md-1" style="float: none; margin:0 auto; text-align:center;"><h4>상세정보 작성</h4><hr>
              <div class="row">
                <div class="col-12 col-sm-4">
                  <div class="info-box bg-light">
                    <div class="info-box-content">
                      <span class="info-box-text text-center text-muted">급여</span>
                      <span class="info-box-number text-center text-muted mb-0"><input type="text" class="form-control" placeholder="급여를 입력하세요"></span>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-sm-4">
                  <div class="info-box bg-light">
                    <div class="info-box-content">
                      <span class="info-box-text text-center text-muted">요구경력</span>
                      <span class="info-box-number text-center text-muted mb-0"><input type="text" class="form-control" placeholder="요구경력을 입력하세요"></span>
                    </div>
                  </div>
                </div>
               <div class="col-12 col-sm-4">
                  <div class="info-box bg-light">
                    <div class="info-box-content">
                      <span class="info-box-text text-center text-muted">근무지</span>
                      <span class="info-box-number text-center text-muted mb-0"><input type="text" class="form-control" placeholder="근무지를 입력하세요"></span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-sm-4">
                  <div class="info-box bg-light">
                    <div class="info-box-content">
                      <span class="info-box-text text-center text-muted">요구학력</span>
                      <span class="info-box-number text-center text-muted mb-0"><input type="text" class="form-control" placeholder="요구학력를 입력하세요"></span>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-sm-4">
                  <div class="info-box bg-light">
                    <div class="info-box-content">
                      <span class="info-box-text text-center text-muted">근무형태</span>
                      <span class="info-box-number text-center text-muted mb-0"><input type="text" class="form-control" placeholder="근무형태를 입력하세요"></span>
                    </div>
                  </div>
                </div>
               <div class="col-12 col-sm-4">
                  <div class="info-box bg-light">
                    <div class="info-box-content">
                      <span class="info-box-text text-center text-muted">근무시작일</span>
                      <span class="info-box-number text-center text-muted mb-0"><input type="text" class="form-control" placeholder="근무시작일을 입력하세요"></span>
                    </div>
                  </div>
                </div>
              </div>
               <div class="row">
                <div class="col-12 col-sm-4">
                  <div class="info-box bg-light">
                    <div class="info-box-content">
                      <span class="info-box-text text-center text-muted">담당자</span>
                      <span class="info-box-number text-center text-muted mb-0"><input type="text" class="form-control" placeholder="담당자명을 입력하세요"></span>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-sm-4">
                  <div class="info-box bg-light">
                    <div class="info-box-content">
                      <span class="info-box-text text-center text-muted">담당자 연락처</span>
                      <span class="info-box-number text-center text-muted mb-0"><input type="text" class="form-control" placeholder="담당자 연락처를 입력하세요"></span>
                    </div>
                  </div>
                </div>
               <div class="col-12 col-sm-4">
                  <div class="info-box bg-light">
                    <div class="info-box-content">
                      <span class="info-box-text text-center text-muted">담당자 이메일</span>
                      <span class="info-box-number text-center text-muted mb-0"><input type="text" class="form-control" placeholder="담당자 이메일을 입력하세요"></span>
                    </div>
                  </div>
                </div>
              </div>
            </div> 
							</div>
							
							<div class="row mb-2" style="margin-left: 1.25rem;">
						<div class="col-sm-11">
							<button type="button" class="btn" onclick="location.href='javascript:history.go(-1);'"
								style="font-size: 1rem; background-color: #f5df4d; color: #939597; font-weight: bold; line-height: 1.3rem;">뒤로가기</button>
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn"
								style="font-size: 1rem; background-color: #f5df4d; color: #939597; font-weight: bold; line-height: 1.3rem;">완료</button>
						</div>
					</div>
						</div>
					</div>
					<!-- /.col-->
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Project Detail</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Project Detail</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Projects Detail</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
        <div class="card-body">
          <div class="row">

            <div class="col-12 col-md-12 col-lg-4 order-1 order-md-2">
              <h3 class="text-primary"><i class="fas fa-paint-brush"></i> AdminLTE v3</h3>
              <p class="text-muted">Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terr.</p>
              <br>
              <div class="text-muted">
                <p class="text-sm">Client Company
                  <b class="d-block">Deveint Inc</b>
                </p>
                <p class="text-sm">Project Leader
                  <b class="d-block">Tony Chicken</b>
                </p>
              </div>

              <h5 class="mt-5 text-muted">Project files</h5>
              <ul class="list-unstyled">
                <li>
                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-file-word"></i> Functional-requirements.docx</a>
                </li>
                <li>
                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-file-pdf"></i> UAT.pdf</a>
                </li>
                <li>
                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-envelope"></i> Email-from-flatbal.mln</a>
                </li>
                <li>
                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-image "></i> Logo.png</a>
                </li>
                <li>
                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-file-word"></i> Contract-10_12_2014.docx</a>
                </li>
              </ul>
              <div class="text-center mt-5 mb-3">
                <a href="#" class="btn btn-sm btn-primary">Add files</a>
                <a href="#" class="btn btn-sm btn-warning">Report contact</a>
              </div>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	</div>
	<!-- Summernote -->
	<script
		src="/codemoa/resources/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- CodeMirror -->
	<script src="/codemoa/resources/plugins/codemirror/codemirror.js"></script>
	<script src="/codemoa/resources/plugins/codemirror/mode/css/css.js"></script>
	<script src="/codemoa/resources/plugins/codemirror/mode/xml/xml.js"></script>
	<script
		src="/codemoa/resources/plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
	<script>
            $(function () {
                // Summernote
                $('#summernote').summernote({
                	height: 500,
                	disableResizeEditor: true,
                	focus: true
                	/* placeholder */
                });
                $('.note-statusbar').hide()
                // CodeMirror
                CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
                    mode: "htmlmixed",
                    theme: "monokai"
                });
            })
        </script>
</body>
</html>
