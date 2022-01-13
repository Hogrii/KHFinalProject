<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
 <style>
        * {box-sizing: border-box;}

        body{
            margin: 0;  /* 임시로 body margin 0px */
        }

        /* div{border:1px solid black} */

        .banner{
            background-color: rgb(56, 181, 174);
            height:200px;
        }

        .banner_title{
            width: 100%;
            height: 70%;
            color: white;
            font-size: 35px;
            font-weight: 600;
            padding: 60px 0px 10px 100px;
        }

        .banner_content{
            width: 100%;
            height: 30%;
            color: white;
            font-size: 15px;
            font-weight: 500;
            padding-left: 100px;
        }

        .container{
            border:1px solid red;
        }

        .container>.root{
            padding-left: 80px;
            overflow: auto;
        }

        .root>div{
            border:1px solid red;
            float:left;
            margin: 40px 0px 40px 0px;
            padding-right: 10px;
        }

       .writeForm{
            border: 1px solid red;
        }
        
        .catetitle{
        	overflow: auto;
        	padding: 0px 80px 0px 80px;
        }
        
        .category{
        	width:10%;
        	float:left;
        }
        
        .title{
        	border: 1px solid red;
        	width:90%;
        	float:left;
        }
        
        .title>input{
        	width:100%;
        }        
        
         .writeForm>div{ 
             border: 1px solid red; 
         }
         
         .contents{
        	padding-right:80px;
        }
        
        .ft_btn{
            border: 1px solid red;
            width: 100%;
            text-align: right;
        }
        
        /* 링크 속성 지우기 */
        a { text-decoration:none  } 
        a:hover { text-decoration:none; color: black; }
        a:link {text-decoration: none; color: black; }
        a:visited {text-decoration: none; color: black; }
        a:active {text-decoration: none; color: black; }
        
        .fa-home{
            color: rgb(56, 181, 174);
        }
        
        
	</style>
</head>
   
<body>
	<form action="/tourboard/modify" method="post" id="frmDetail" enctype="multipart/form-data">
    <!-- .banner에 이미지 추가해야한다.-->
    <div class="banner">
        <div class="banner_title" href="">여행지 게시판</div>
        <div class="banner_content">각 지역의 여행 후기를 남겨보세요</div>
    </div>
    <div class="container">
        <div class="root">
            <div class="home"><i class="fas fa-home" href=""></i></div>
            <div> > </div>
            <div class="community" href="">커뮤니티</div>
            <div> > </div>
            <div class="tourboard" href="">여행지 게시판</div>
        </div>
        <div class="writeForm">
        	<div class="catetitle">        		
                <div class="category" >
                	<input type=text value="[${dto.category }]" id="discategory" style="border:0px; text-align:center; width:100%;" readonly>
                    <select style="display:none"; id="modcategory">
                        <option value="">말머리</option>
                        <option value="">명소</option>
                        <option value="">문화</option>
                        <option value="">생태</option>
                        <option value="">체험</option>
                    </select>
                </div>
                <div class="title">
         			<input type=hidden value="${dto.seq}" name=seq>
                 	<input type=text placeholder="제목을 입력하세요" id="title" name="title" value="${dto.title }" readonly>
                </div>
            </div><br>
            <div class="contents" style="margin-left:80px; readonly">
 				<textarea id="summernote" rows="5" name="explanation" style="width:100%; height:250px;" style="display:none; height:300px;">${dto.contents }</textarea>
 			</div>
        </div>
        <div class="ft_btn">
        	<a href="/tourboard/list"><button type=button>목록으로</button></a>
<%--         	<c:if test="${dto.writer == loginID}"> --%>
			<button type=button id=mod>수정하기</button>
			<button type=button id=del>삭제하기</button>
			<button type=button id=modOk style="display: none;">수정완료</button>
			<button type=button id=modCancel style="display: none;">취소</button>
<%-- 			</c:if> --%>
        </div>
    </div>    
    </form>
    <script>
    $("#del").on("click", function() {
		if (confirm("정말 삭제하시겠습니까?")) {
			location.href = "/tourboard/delete?seq=${dto.seq}";
		}
	});
    </script>
    <script>
    $("#list_btn").on("click", function(){
	    	history.back();
	    })
    </script>
    
    <script>
    $("#mod").on("click", function() {

			bkTitle = $("#title").val();
			bkContents = $("#contents").val();

			$("#title").removeAttr("readonly");
			$("#contents").removeAttr("readonly");
			$("#mod").css("display", "none");
			$("#del").css("display", "none");
			$("#modOk").css("display", "inline");
			$("#modCancel").css("display", "inline");
			$("#discategory").css("display", "none");
			$("#modcategory").css("display", "inline");
			
			// 서머노트 쓰기 활성화
			$('#summernote').summernote('enable');
		});
    </script>
    
    <script>
    $("#modOk").on("click", function() {
			if (confirm("이대로 수정하시겠습니까?")) {
				$("#frmDetail").submit();
			}
		});
    </script>

	<script>
		$("#modCancel").on("click", function() {
			if (confirm("정말 취소하시겠습니까?")) {
				$("#title").val(bkTitle);
				$("#contents").val(bkContents);
				$("#title").attr("readonly", "");
				$("#contents").attr("readonly", "");
				$("#mod").css("display", "inline");
				$("#del").css("display", "inline");
				$("#modOk").css("display", "none");
				$("#modCancel").css("display", "none");
				$("#discategory").css("display", "inline");
				$("#modcategory").css("display", "none");
				
				// 서머노트 쓰기 비활성화
				$('#summernote').summernote('disable');
			}
		})
	</script>
	
	<script>
    $(document).ready(function() {
    	//여기 아래 부분
    	$('#summernote').summernote('disable', {
    		  height: 300,                 // 에디터 높이
    		  minHeight: null,             // 최소 높이
    		  maxHeight: null,             // 최대 높이
    		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
    		  lang: "ko-KR",					// 한글 설정
    		 
    		  placeholder: '최대 2048자까지 쓸 수 있습니다' 	//placeholder 설정
    	});
    });
    </script> 

</body>
</html>