<%@ Page Title="" Language="C#" MasterPageFile="~/WebMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="start"></div>
    <header id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators" data-sr='wait 3s, then enter top and hustle 40px over 1.5s'>
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill_1">
                    <div class="fill_11"></div>
                </div>
                <div class="carousel-caption">
                    <div class="col-md-12 caro">
                        <h2 data-sr='wait 1.5s, then enter left and hustle 100px over 2s'>Music </h2>
                        <h2 data-sr='wait 2.6s, then enter top and hustle 100px over 2s'>We love </h2>
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
                        <h2>Let the  </h2>
                        <h2>Music Speak!  </h2>
                        <div>
                            <a class="enjoy-button hvr-shutter-out-vertical-transparent" href="#" role="button">Concerts</a>
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
                        <h2>We play</h2>
                        <h2>every day </h2>
                        <div>
                            <a class="enjoy-button hvr-shutter-out-vertical-transparent" href="#contact" role="button">Contact Us</a>
                        </div>
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
                    <h2 data-sr='wait 0.1s, then enter bottom and hustle 125px over 1.5s'>About Us</h2>
                    <p id="text-aboutus" data-sr='wait 0.1s, then enter bottom and hustle 125px over 1.5s'>
                        Piano Plus Studio offers piano lessons in Vancouver with our team of certified teachers. They are
                        all unique and offer varied and accomplished piano teaching backgrounds. Piano lessons from our teachers take place either 
                        as an in-home lesson (your home) or in our studio. Our studio offers 30 minute, 45 minute and 60 minute Piano Lessons to anyone ages 5 and older. 
                        Each Piano Lesson is customized by a Certified Resonate Instructor to be personally suited to each individual student’s skill level and goals.
                    </p>
                </div>
            </div>
        </section>
    </div>
    <!--[About Us end]-->

    <!--[youtube]-->
    <div class="container-fluid y-t" data-sr='wait 0.1s, then enter bottom and hustle 55px over 1.5s'>
        <div class="testimonial-border-video"></div>
        <h2>Schumann: Arabeske in C major, Op 18</h2>
        <div class="col-md-6 col-md-offset-3 ">
            <div class="videowrapper well">
                <iframe height="300" width="500" src="https://www.youtube.com/embed/adAwsvdjbhY" allowfullscreen=""></iframe>
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
        <figure class="col-md-2 col-sm-6 col-xs-12 images-gallery">
            <img class="img gallery" src="Images/works/1.jpg" alt="" />
            <figcaption>
                <h2>zoom</h2>
                <img class="img gallery-icon" src="Images/lupa.png" alt="" />
            </figcaption>
        </figure>
    </a>
    <a href="#openModal2">
        <figure class="col-md-2 col-sm-6 col-xs-12 images-gallery image">
            <img class="img gallery" src="Images/works/2.jpg" alt="" />
            <figcaption>
                <h2>zoom</h2>
                <img class="img gallery-icon" src="Images/lupa.png" alt="" />
            </figcaption>
        </figure>
    </a>
    <a href="#openModal3">
        <figure class="col-md-4 col-sm-6 col-xs-12 images-gallery">
            <img class="img gallery" src="Images/works/3.jpg" alt="" />
            <figcaption>
                <h2>zoom</h2>
                <img class="img gallery-icon" src="Images/lupa.png" alt="" />
            </figcaption>
        </figure>
    </a>
    <a href="#openModal7">
        <figure class="col-md-4 col-sm-6 col-xs-12 images-gallery">
            <img class="img gallery" src="Images/works/7.jpg" alt="" />
            <figcaption>
                <h2>zoom</h2>
                <img class="img gallery-icon" src="Images/lupa.png" alt="" />
            </figcaption>
        </figure>
    </a>
    <a href="#openModal4">
        <figure class="col-md-4 col-sm-6 col-xs-12 images-gallery">
            <img class="img gallery" src="Images/works/4.jpg" alt="" />
            <figcaption>
                <h2>zoom</h2>
                <img class="img gallery-icon" src="Images/lupa.png" alt="" />
            </figcaption>
        </figure>
    </a>
    <a href="#openModal5">
        <figure class="col-md-4 col-sm-6 col-xs-12 images-gallery">
            <img class="img gallery" src="Images/works/5.jpg" alt="" />
            <figcaption>
                <h2>zoom</h2>
                <img class="img gallery-icon" src="Images/lupa.png" alt="" />
            </figcaption>
        </figure>
    </a>
    <a href="#openModal6">
        <figure class="col-md-4 col-sm-6 col-xs-12 images-gallery">
            <img class="img gallery" src="Images/works/6.jpg" alt="" />
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
        <img class="img" src="images/works/1.jpg" alt="" />
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
        <img class="img" src="images/works/3.jpg" alt="" />
    </div>
</div>

<div id="openModal4" class="modalDialog">
    <div>
        <a href="#close" title="Close" class="close">X</a>
        <img class="img" src="images/works/4.jpg" alt="" />
    </div>
</div>

<div id="openModal5" class="modalDialog">
    <div>
        <a href="#close" title="Close" class="close">X</a>
        <img class="img" src="images/works/5.jpg" alt="" />
    </div>
</div>

<div id="openModal6" class="modalDialog">
    <div>
        <a href="#close" title="Close" class="close">X</a>
        <img class="img" src="images/works/6.jpg" alt="" />
    </div>
</div>
<div id="openModal7" class="modalDialog">
    <div>
        <a href="#close" title="Close" class="close">X</a>
        <img class="img" src="images/works/7.jpg" alt="" />
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
                    <input type="text" class="form-control" name="InputName" id="InputName" placeholder="Name" />
                    <span class="input-group-addon"><i></i></span></div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <input type="email" class="form-control" id="InputEmail" name="InputEmail" placeholder="Email" />
                    <span class="input-group-addon"><i></i></span></div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <textarea name="InputMessage" id="InputMessage" class="form-control" rows="10" placeholder="Message" ></textarea>
                    <span class="input-group-addon"><i></i></span></div>
            </div>
            <div class="form-group">
            </div>
            <div class="col-md-12 contact-send">
                <asp:Button ID="buttonContact" runat="server" Text="Send" class="btn send hvr-shutter-out-vertical-contact-form" />
            </div>
        </div>
        <div class="col-md-4 lead" data-sr='wait 0.1s, then enter bottom and hustle 55px over 1.5s'>
            <h2>Contacts</h2>
            <div class="testimonial-border"></div>
            <p>Mobile: (778) 896 - 9098</p>
            <p>Mobile: (604) 505 - 6583</p>
            <p>Mail: monv1108@icloud.com</p>
        </div>
        <hr class="featurette-divider hidden-lg" />
    </div>
    </section>
</div>
<!--[contact-end]-->

    <script type="text/javascript" src="Scripts/js/jquery-1.11.2.min.js"></script>
</asp:Content>

