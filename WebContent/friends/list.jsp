<%@page import="com.petharu.web.entity.DiaryComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.petharu.web.entity.Diary"%>
<%@page import="com.petharu.web.service.JdbcFriendService"%>
<%@page import="com.petharu.web.service.FriendService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
JdbcFriendService friendService = new JdbcFriendService();
List<Diary> list = friendService.getFriendDiaryList(1);
List<DiaryComment> diaryCommentslist = friendService.getFriendDiaryCommentList(1);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이웃집-친구피드조회</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link href="friend-list.css" type="text/css" rel="stylesheet">
    <script defer src="list.js"></script>
</head>
<body>
    <div id="root">
        <header id="header">
            <div class="float-content">
                <div class="flex align-center">
                    <a href="" class="logo-title-container">
                        <img src="../images/logo.png" alt="">
                    </a>
                    <nav class="main-menu">   
                            <h1 class="d-none">메인메뉴</h1>
                            <ul>
                              <li><a href="../../myhome/list.html">우리집</a></li>
                              <li><a href="list.html">이웃집</a></li>
                              <li><a href="../pet-management/mypet/list.html">내 동물관리</a></li>
                              <li><a href="../../community/notice/list.html">커뮤니티</a></li>
                          </ul>
                    </nav>
                </div>
                <nav class="member-menu">
                    <h1 class="d-none">회원메뉴</h1>
                    <ul>
                      <li><a href="../../mypage/profile/progile-edit.html">MyPage</a></li>
                      <li><a href="../../login">LogOut</a></li>
                  </ul>
                </nav>
            </div>
        
            
        </header>

        <div id="body">
            <div class="float-content">


                <main id="main">
                    
                  <h1 class="d-none">친구피드조회</h1>

                  <div class="outline">

                    <div class="page-description"><h3>이웃집의 반려동물 소식을 알려드려요!</h3></div>
                    <div class="subject"><h1>이웃집</h1><span class="recommend"><a href="">둘러보기</a></span></div>
                   
                    <div class="follow-menu-outline">
                    <div class="friends">
                      <h3 class="d-none">친구관리</h1>
                       <table class="table">
                         <thead class="table-head">
                             <tr class="total">
                                <td class="requests">2</td>  
                                <td class="followers">7</td>
                                <td class="following">7</td>
                             </tr>
                         </thead>
                         <tbody class="table-body">
                           <tr>
                            <td class="requests">Requests</td>
                            <td class="followers">Followers</td>
                            <td class="">Following</td>
                           </tr>
                         </tbody>
                       </table>
                    </div>

                        <div class="search-form-outline">
                            <div class='search-form'>
                            <input type='search' class='input_search' value="친구 검색"/>
                            <div class="autocom-box">
                                <!-- here list are inserted from javascript -->
                              </div>
                            <button type='submit' class='sch_smit'><i class="fas fa-search"></i></button>
                            </div>
                        </div><!--search-form-outline-->                        
                    </div><!--follow-menu-outline-->


                    <div class=container><!--container : box list-->
                      
                    <div class="big-box">
                    <%for(Diary d:list){ %>
                        <div class="box">
                            <div class="img-box"><img class="diary-img" src="https://images.unsplash.com/photo-1562714529-94d65989df68?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80"></div>
                        <div class="user"><a class="userinfo" href=""><img src="https://t3.ftcdn.net/jpg/02/92/94/20/240_F_292942036_FoCWnPBmDkeJaK2rvc7K6R9FctFfnTJs.jpg" alt="">
                            <span><%=d.getUerId() %></span></a><img class="heart"src="../images/heart.png"><span class="sub-info"> 114</span>                        
                        </div>
                        <div class="diary-content">
                            <a class="diary-content-link" href="">
                            <p><%=d.getContent() %></p></a>
                        </div>

                        <div class="showDiary">
                          <div class="overlay"></div>
                          <div class="content">
                              <div class="content-box-img">
                                  <img class="img" src="https://images.unsplash.com/photo-1562714529-94d65989df68?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80" alt="">
                              </div>
                              <div class="close-btn">x</div>
                              <div class="main-box">
                                  <div class="main-box-title">
                                      <span><%=d.getContent() %></span>    
                                  </div>
                                  
                                  <div class="main-box-content">
                                      <div class="user-img-box">
                                          <img class="user-img" src="https://images.unsplash.com/photo-1592817797597-392e3b878e1c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" alt="">
                                      </div>
                                      <div>
                                        <span class="user-id"><%=d.getUerId() %></span>
                                        <span>
                                            <%=d.getContent() %>
                                        </span>
                                    </div>
                                  </div>
                                  <div class="comment-box">
                                  <%for(DiaryComment dc : diaryCommentslist){ %>
                                      <div class="main-box-comment">
                                          <div class="user-img-box">
                                              <img class="user-img" src="https://images.unsplash.com/photo-1561312176-5aedf7172115?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=633&q=80" alt="">
                                          </div>
                                          <div>
                                              <span class="user-id"><%=dc.getUerId() %></span>
                                              <span>
                                                  <%=dc.getContent() %>
                                              </span>
                                          </div>
                                      </div>
									<%} %>
                                  </div>

                                  <div class="comment-record">
                                      <form class="comment-form">
                                          <input class="input-comment" type="text" placeholder="댓글 달기...">
                                          <input class="submit-comment" type="submit" value="게시">
                                      </form>
                                  </div>
                              </div>
                          </div>
                      </div>

                        </div><!--box-->
					<%} %>
                    </div><!--big box-->


                       
                      </div><!--container-->
                </div>

                <div class="outline-popup">

                    <div class="popup" id="popup-3">
                        <div class="overlay"></div>
                        <div class="content">
                          <div class="close-btn">&times;</div>
                          <div class="list-box">
                            <div class="total">
                              <h4>Friend Requests ( <span class="num">2</span> )</h4>
                              
                            </div>
                    
                           <section class="request-content">
                               <ul>
                                   <li class="request-box">
                                       <div class="name"><a href="">id00000000</a></div>
                                       <img class="request-img"src="https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=660&q=80" alt="">
                                       <!-- <span calss="date">2021-05-18</span>  -->
                                       <span class="sub"></span>
                                         <span class="accept" id="button">Accept</span>
                                         <span class="decline">Decline</span>
                                   </li>
                               </ul>
                           </section>

                           <section class="request-content">
                            <ul>
                                <li class="request-box">
                                    <div class="name"><a href="">id00000000</a></div>
                                    <img class="request-img"src="https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=660&q=80" alt="">
                                    <span calss="date">2021-05-18</span> 
                                      <span class="accept" id="button">Accept</span>
                                      <span class="decline">Decline</span>
                                </li>
                            </ul>
                        </section>



                    
                          </div><!--list box-->
                        </div>
                        </div><!--friend Request popup-->

                    <div class="popup" id="popup-1">
                    <div class="overlay"></div>
                    <div class="content">
                      <div class="close-btn">&times;</div>
                      <div class="list-box">
                        <div class="total">
                          <h4>Followers ( <span class="num">7</span> )</h4>
                        </div>
                
                        <div class="follow-info">
                            <img src="../images/dog.jpg" alt="">
                            <div class="f-name"><a href="">id00000000</a></div>
                            <div class="f-status">
                              <span class="button">Following</span>
                            </div>
                          </div>
                
                       <div class="follow-info">
                         <img src="../images/dog.jpg" alt="">
                         <div class="f-name"><a href="">id00000000</a></div>
                         <div class="f-status">
                           <span class="button">Following</span>
                         </div>
                       </div>
                
        
                
                      </div><!--list box-->
                    </div>
                    </div><!--followers popup-->
                    
                    <div class="popup" id="popup-2">
                        <div class="overlay"></div>
                        <div class="content">
                        <div class="close-btn">&times;</div>
                        
                        <div class="list-box">
                    
                            <div class="total">
                                <h4>Following ( <span class="num">7</span> )</h4>
                            </div>
                    
                        <div class="follow-info">
                            <img src="../images/dog.jpg" alt="">
                            <div class="f-name"><a href="">id00000000</a></div>
                            <div class="f-status"><span class="button">Following</span></div>
                        </div>
                    
                        <div class="follow-info">
                            <img src="../images/dog.jpg" alt="">
                            <div class="f-name"><a href="">id00000000</a></div>
                            <div class="f-status">
                            <span class="button">Following</span>
                            </div>
                        </div>
                    
                        <div class="follow-info">
                            <img src="../images/dog.jpg" alt="">
                            <div class="f-name"><a href="">id00000000</a></div>
                            <div class="f-status">
                            <span class="button">Following</span>
                            </div>
                        </div>
                    
                        <div class="follow-info">
                            <img src="../images/dog.jpg" alt="">
                            <div class="f-name"><a href="">id00000000</a></div>
                            <div class="f-status">
                            <span class="button">Following</span>
                            </div>
                        </div>
                    
                        <div class="follow-info">
                            <img src="../images/dog.jpg" alt="">
                            <div class="f-name"><a href="">id00000000</a></div>
                            <div class="f-status">
                            <span class="button">Following</span>
                            </div>
                        </div>
                    
                        <div class="follow-info">
                            <img src="../images/dog.jpg" alt="">
                            <div class="f-name"><a href="">id00000000</a></div>
                            <div class="f-status">
                            <span class="button">Following</span>
                            </div>
                        </div>
                    
                        <div class="follow-info">
                            <img src="../images/dog.jpg" alt="">
                            <div class="f-name"><a href="">id00000000</a></div>
                            <div class="f-status">
                            <span class="button">Following</span>
                            </div>
                        </div>
                    
                        </div><!--list-box-->
                    
                        </div>
                    </div><!--following popup-->

                    
                </div><!--outline-popup-->

                </main>
            </div>
        </div>

        <footer id="footer">footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer footer</footer>


    </div>
    
</body>
</html>