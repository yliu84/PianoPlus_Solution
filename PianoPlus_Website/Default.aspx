<%@ Page Title="" Language="C#" MasterPageFile="~/WebMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="start"></div>
    <header id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators" data-sr='wait 3s, then enter top and hustle 40px over 1.5s'>
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill_1">
                    <div class="fill_11"></div>
                </div>
                <div class="carousel-caption">
                    <div class="col-md-12 caro">
                        <h4 data-sr='wait 1.5s, then enter left and hustle 100px over 2s' style="font-size: 26px">学钢琴不要取巧</h4>
                        <h4 data-sr='wait 2.6s, then enter top and hustle 100px over 2s' style="font-size: 26px">聪明只是开始，勤奋才是音乐家的朋友</h4>
                        <div>
                            <a class="enjoy-button hvr-shutter-out-vertical-transparent" href="PianoLessons.aspx" role="button" data-sr='wait 3.2s, then enter bottom and hustle 100px over 2s'>Our Lessons</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="fill_2">
                    <div class="fill_12"></div>
                </div>
                <div class="carousel-caption">
                    <div class="col-md-12 caro">
                        <h4 style="font-size: 26px">任何事情的成功都不是一蹴而就的 </h4>
                        <h4 style="font-size: 26px">所有付出的时间和精力，都会储存为将来的能力和竞争力</h4>
                        <div>
                            <a class="enjoy-button hvr-shutter-out-vertical-transparent" href="InstructorsInfo.aspx" role="button">Instructors</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="fill_3">
                    <div class="fill_13"></div>
                </div>
                <div class="carousel-caption">
                    <div class="col-md-12 caro">
                        <h4 style="font-size: 26px">不要被“快乐教育”误导</h4>
                        <h4 style="font-size: 26px">以为逼孩子掌握一项特长就是扼杀孩子爱玩的天性</h4>
                        <h4 style="font-size: 26px">事实证明小时候学的特长，长大后孩子都不会后悔的</h4>
                        <div>
                            <a class="enjoy-button hvr-shutter-out-vertical-transparent" href="#contact" role="button">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="fill_4">
                    <div class="fill_14"></div>
                </div>
                <div class="carousel-caption">
                    <div class="col-md-12 caro">
                        <h4 style="font-size: 26px">比赛和考试都不重要</h4>
                        <h4 style="font-size: 26px">重要的是你学习音乐的经历</h4>
                        <h4 style="font-size: 26px">一场演奏能够成功</h4>
                        <h4 style="font-size: 26px">关键在于能否打动人心</h4>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <div class="arrow-left">
                    <img alt="arrow" class="arrow" src="Images/buttons/left_b.png" />
                </div>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <div class="arrow-right">
                    <img alt="arrow" class="arrow" src="Images/buttons/right_b.png" />
                </div>
            </a>
        </div>
    </header>

    <!--[Quotations]-->
    <div class="container-fluid testimonial">
        <div class="row ">
            <div class="col-md-12" data-wow-delay="0.5s">
                <div class="carousel slide" data-ride="carousel" id="quote-carousel">
                    <div class="carousel-inner text-center">
                        <!-- Quote 1 -->
                        <div class="item active">
                            <blockquote>
                                <div class="row">
                                    <div class="col-sm-8 col-sm-offset-2 ">
                                        <div class="testimonial-border"></div>
                                        <p class="testimonial-text">
                                            "The piano keys are black and white but they sound like a million colors in your mind."
                                        </p>
                                        <small>[Maria Cristina Mena]</small>
                                    </div>
                                </div>
                            </blockquote>
                        </div>
                        <!-- Quote 2 -->
                        <div class="item">
                            <blockquote>
                                <div class="row">
                                    <div class="col-sm-8 col-sm-offset-2">
                                        <div class="testimonial-border"></div>
                                        <p class="testimonial-text">
                                            "If I were not a physicist, I would probably be a musician. I often think in music. I live my daydreams in music. I see my life in terms of music."
                                        </p>
                                        <small>[Albert Einstein]</small>
                                    </div>
                                </div>
                            </blockquote>
                        </div>
                        <!-- Quote 3 -->
                        <div class="item">
                            <blockquote>
                                <div class="row">
                                    <div class="col-sm-8 col-sm-offset-2">
                                        <div class="testimonial-border"></div>
                                        <p class="testimonial-text">
                                            "Life is like a piano. What you get out of it depends on how you play it."
                                        </p>
                                        <small>[Tom Lehrer]</small>
                                    </div>
                                </div>
                            </blockquote>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--[Quotations-end]-->

    <!--[About Us]-->
    <div class="container-fluid about-back">
        <section id="about">
            <div class="row">
                <div class="aboutText col-md-12 col-sm-12 about-text">
                    <div class="divider-line" data-sr='wait 0.1s, then enter bottom and hustle 125px over 1.5s'></div>
                    <h2 data-sr='wait 0.1s, then enter bottom and hustle 125px over 1.5s'>教学成果</h2>
                    <div class="row honor" style="margin-top:20px;">
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail" style="background-color:rgba(255,255,255,0.2)">
                                <img src="Images/honor/NaveenYang.jpg" alt="Naveen Yang" style="height:330px" />
                                <div class="caption">
                                    <h3>Naveen Yang (16岁)</h3>
                                    <ul style="list-style:none">
                                        <li>CMC加拿大全国音乐大赛总决赛 第一名</li>
                                        <li>Crescendo美国国际音乐大赛  一等奖</li>
                                        <li>ARCT钢琴演奏级</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail" style="background-color:rgba(255,255,255,0.2)">
                                <img src="Images/honor/LeoGao.jpg" alt="Leo Gao" style="height:330px" />
                                <div class="caption">
                                    <h3>Leo Gao (15岁)</h3>
                                    <ul style="list-style:none">
                                        <li>CMC加拿大全国音乐大赛总决赛 第一名</li>
                                        <li>Crescendo美国国际音乐大赛  一等奖</li>
                                        <li>ARCT钢琴演奏级</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail" style="background-color:rgba(255,255,255,0.2)">
                                <img src="Images/honor/EmmaMiao.jpg" alt="Emma Miao" style="height:330px" />
                                <div class="caption">
                                    <h3>Emma Miao (15岁)</h3>
                                    <ul style="list-style:none">
                                        <li>Crescendo美国国际音乐大赛  一等奖</li>
                                        <li>加拿大青少年艺术家模范奖</li>
                                        <li>仅用5个月时间学习并通过ARCT钢琴演奏级考试</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail" style="background-color:rgba(255,255,255,0.2)">
                                <img src="Images/honor/RebeccaJin.jpg" alt="Rebecca Jin" style="height:330px" />
                                <div class="caption">
                                    <h3>Rebecca Jin (17岁)</h3>
                                    <ul style="list-style:none">
                                        <li>Crescendo美国国际音乐大赛 一等奖</li>
                                        <li>ARCT钢琴演奏级</li>
                                        <li>应邀在纽约卡耐基音乐厅演奏</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail" style="background-color:rgba(255,255,255,0.2)">
                                <img src="Images/honor/VincentZhang.jpg" alt="Vincent Zhang" style="height:330px" />
                                <div class="caption">
                                    <h3>Vincent Zhang (15岁)</h3>
                                    <ul style="list-style:none">
                                        <li>ARCT钢琴演奏级</li>
                                        <li>加拿大青少年艺术家模范奖</li>
                                        <li>在维也纳金色大厅、纽约卡耐基音乐厅等著名场所演奏</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail" style="background-color:rgba(255,255,255,0.2)">
                                <img src="Images/honor/JulieLin.jpg" alt="Julie Lin" style="height:330px" />
                                <div class="caption">
                                    <h3>Julie Lin (14岁)</h3>
                                    <ul style="list-style:none">
                                        <li>ARCT钢琴演奏级</li>
                                        <li>Crescendo美国国际音乐大赛 一等奖</li>
                                        <li>加拿大青少年艺术家模范奖</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail" style="background-color:rgba(255,255,255,0.2)">
                                <img src="Images/honor/AlexZhang.jpg" alt="Alex Zhang" style="height:330px" />
                                <div class="caption">
                                    <h3>Julie Lin (11岁)</h3>
                                    <ul style="list-style:none">
                                        <li>ARCT钢琴演奏级在读</li>
                                        <li>加拿大青少年艺术家模范奖</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--<div class="row">
                        <div class="col-sm-9">
                            <p id="text-aboutus" data-sr='wait 0.1s, then enter bottom and hustle 125px over 1.5s'>
                                <b style="font-size: large;color:gold">* Leo Shengxiao Gao, Naveen Jiuru Yang获得2019年CMC大赛一等奖!</b><br />
                
                                <b style="font-size:16px;font-weight:normal; color:gold">(Leo Shengxiao Gao and and Naveen Jiuru Yang won the 2019 CMC(Canadian Music Competition)'s first prize!)</b>
                                <br />
                                <br />
                                <b>Rebecca, Jin (17 岁)</b><br />
                                Crescendo 美国国际音乐大赛以满分的最高成绩获得一等奖ARCT钢琴演奏级应邀在纽约卡耐基音乐厅演奏
                                <br />
                                <b>Naveen Yang (16岁)</b><br />
                                CMC加拿大全国音乐大赛总决赛第一名
                                <br />
                                <b>Julie Lin</b><br />
                                Little Mozart美国国际音乐大赛一等奖， 应邀在纽约卡耐基音乐厅演出
                                <br />
                                <b>Vincent Zhang (13岁)</b><br />
                                获邀出席第九届欧洲中国文化节， 在维也纳金色大厅演奏
                                <br />
                                <b>Naveen Yang (14岁)</b><br />
                                获邀出席第九届欧洲中国文化节， 在维也纳金色大厅演奏
                                <br />
                                <b>Amy Zeng (14岁)</b><br />
                                RCM皇家考级十级钢琴演奏，第一等级
                                <br />
                                <b>Emma Miao (14岁)</b><br />
                                RCM皇家考级十级钢琴演奏，第一等级                                  
                                <br />
                                <b>Alex Zhang (11岁)</b><br />
                                RCM皇家考级十级钢琴演奏，通过并达ARCT分数
                                <br />
                                <b>ZiQing Xiong (13岁)</b><br />
                                RCM皇家考级八级钢琴演奏，第一等级
                                <br />
                                <b>Ella Cao (10岁)</b><br />
                                RCM皇家考级七级钢琴演奏，第一等级
                                <br />
                                <b>Jenny Yu (10岁)</b><br />
                                RCM皇家考级六级钢琴演奏，第一等级
                            </p>
                        </div>
                        <div class="col-sm-3" data-sr='wait 0.1s, then enter bottom and hustle 125px over 1.5s'>
                            <img src="Images/works/IMG_2573.jpg" alt="Leo & Naveen" style="width: 100%; height: auto; margin-top: 50px; border-radius:6px;" />

                        </div>
                    </div>--%>


                </div>
            </div>
        </section>
    </div>
    <!--[About Us end]-->

    <!--[youtube]-->
    <div class="container-fluid y-t" data-sr='wait 0.1s, then enter bottom and hustle 55px over 1.5s'>
        <div class="testimonial-border-video"></div>
        <h2>Schumann: Fantasiestücke op. 12</h2>
        <div class="col-md-6 col-md-offset-3 ">
            <div class="videowrapper well">
                <iframe height="300" width="500" src="https://www.youtube.com/embed/NnvUcHI4BoA" allowfullscreen=""></iframe>
            </div>
        </div>
    </div>
    <!--[youtube-end]-->

    <!--[sociel-icons]-->
    <div class="container-fluid social">
        <div class="row">
            <div class="col-md-12">
                <div class="social-icon">
                    <ul class="social-icon">
                        <li class="icon">
                            <a href="#" target="_blank" id="Pinterest"></a>
                        </li>
                        <li class="icon">
                            <a href="#" target="_blank" id="Facebook"></a>
                        </li>
                        <li class="icon">
                            <a href="#" target="_blank" id="Twitter"></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--[social-icons-end]-->

    <!--[Gallery]-->
    <div id="works">
    </div>
    <div id="gallery" data-sr='wait 0.1s, then enter bottom and hustle 20px over 1s'>
        <a href="#openModal1">
            <figure class="col-md-4 col-sm-6 col-xs-12 images-gallery">
                <img class="img gallery" src="Images/works/14.jpg" alt="" />
                <figcaption>
                    <h2>zoom</h2>
                    <img class="img gallery-icon" src="Images/lupa.png" alt="" />
                </figcaption>
            </figure>
        </a>

        <a href="#openModal3">
            <figure class="col-md-4 col-sm-6 col-xs-12 images-gallery">
                <img class="img gallery" src="Images/works/IMG_2453.jpg" alt="" />
                <figcaption>
                    <h2>zoom</h2>
                    <img class="img gallery-icon" src="Images/lupa.png" alt="" />
                </figcaption>
            </figure>
        </a>
        <a href="#openModal7">
            <figure class="col-md-4 col-sm-6 col-xs-12 images-gallery">
                <img class="img gallery" src="Images/works/IMG_2447.jpg" alt="" />
                <figcaption>
                    <h2>zoom</h2>
                    <img class="img gallery-icon" src="Images/lupa.png" alt="" />
                </figcaption>
            </figure>
        </a>
        <a href="#openModal4">
            <figure class="col-md-4 col-sm-6 col-xs-12 images-gallery">
                <img class="img gallery" src="Images/works/IMG_2454.jpg" alt="" />
                <figcaption>
                    <h2>zoom</h2>
                    <img class="img gallery-icon" src="Images/lupa.png" alt="" />
                </figcaption>
            </figure>
        </a>
        <a href="#openModal5">
            <figure class="col-md-4 col-sm-6 col-xs-12 images-gallery">
                <img class="img gallery" src="Images/works/10.jpg" alt="" />
                <figcaption>
                    <h2>zoom</h2>
                    <img class="img gallery-icon" src="Images/lupa.png" alt="" />
                </figcaption>
            </figure>
        </a>
        <a href="#openModal6">
            <figure class="col-md-4 col-sm-6 col-xs-12 images-gallery">
                <img class="img gallery" src="Images/works/11.jpg" alt="" width="100%" />
                <figcaption>
                    <h2>zoom</h2>
                    <img class="img gallery-icon" src="Images/lupa.png" alt="" />
                </figcaption>
            </figure>
        </a>
    </div>

    <div id="openModal1" class="modalDialog">
        <div>
            <a href="#close" title="Close" class="close">X</a>
            <img class="img" src="images/works/14.jpg" alt="" />
        </div>
    </div>

    <div id="openModal2" class="modalDialog">
        <div>
            <a href="#close" title="Close" class="close">X</a>
            <img class="img" src="images/works/2.jpg" alt="" />
        </div>
    </div>

    <div id="openModal3" class="modalDialog">
        <div>
            <a href="#close" title="Close" class="close">X</a>
            <img class="img" src="images/works/IMG_2453.jpg" alt="" />
        </div>
    </div>

    <div id="openModal4" class="modalDialog">
        <div>
            <a href="#close" title="Close" class="close">X</a>
            <img class="img" src="images/works/IMG_2454.jpg" alt="" />
        </div>
    </div>

    <div id="openModal5" class="modalDialog">
        <div>
            <a href="#close" title="Close" class="close">X</a>
            <img class="img" src="images/works/10.jpg" alt="" />
        </div>
    </div>

    <div id="openModal6" class="modalDialog">
        <div>
            <a href="#close" title="Close" class="close">X</a>
            <img class="img" src="images/works/11.jpg" alt="" />
        </div>
    </div>
    <div id="openModal7" class="modalDialog">
        <div>
            <a href="#close" title="Close" class="close">X</a>
            <img class="img" src="images/works/IMG_2447.jpg" alt="" />
        </div>
    </div>
    <!--[Gallery-end]-->

    <!--[contact]-->
    <div class="container-fluid contact-background">
        <section id="contact">
            <div class="row contact">
                <div class="col-md-6 col-md-offset-2 contact-header" data-sr='wait 0.2s, then enter left and hustle 50px over 1s'>
                    <div class="border-contact"></div>
                    <h2>Leave Us a Message</h2>
                    <div class="form-group">
                        <div class="input-group">
                            <input runat="server" type="text" class="form-control" name="InputName" id="InputName" placeholder="Name" />
                            <span class="input-group-addon"><i></i></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <input runat="server" type="email" class="form-control" id="InputEmail" name="InputEmail" placeholder="Email" />
                            <span class="input-group-addon"><i></i></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <textarea runat="server" name="InputMessage" id="InputMessage" class="form-control" rows="10" placeholder="Message"></textarea>
                            <span class="input-group-addon"><i></i></span>
                        </div>
                    </div>
                    <div class="form-group">
                    </div>
                    <div class="col-md-12 contact-send">
                        <asp:Button ID="buttonContact" runat="server" Text="Send" class="btn send hvr-shutter-out-vertical-contact-form" OnClick="buttonContact_Click" />
                    </div>
                </div>
                <div class="col-md-4 lead" data-sr='wait 0.1s, then enter bottom and hustle 55px over 1.5s'>
                    <h2>Contacts</h2>
                    <div class="testimonial-border"></div>
                    <p>Mobile: (778) 896 - 9098</p>
                    <p>Mail: info.hymedu@gmail.com</p>
                </div>
                <hr class="featurette-divider hidden-lg" />
            </div>
        </section>
    </div>
    <!--[contact-end]-->

    <script type="text/javascript" src="Scripts/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="Content/slick/slick.min.js"></script>
    <script>
        $('.honor').slick({
  slidesToShow: 3,
  slidesToScroll: 1,
  autoplay: true,
  autoplaySpeed: 2000,
});
    </script>
</asp:Content>

