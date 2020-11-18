<%@ Page Title="Gallery" Language="C#" MasterPageFile="~/WebMaster.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">


    <style type="text/css">
        p {
            color: GrayText;
            margin-bottom: 5px;
            font-size: 16px;
        }

        .my-gallery .row{
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
        }

        .my-gallery{
            padding:4rem 0;
        }

        .my-gallery h2{
            text-align:center;
        }

        .my-gallery .button-group {
            padding-bottom: 20px;
        }


        .my-gallery .button-group button {
            background: transparent;
            border: none;
            font: normal 500 16px/130px var(--roboto);
            text-transform: uppercase;
        }

            .my-gallery .button-group button + button {
                padding-left: 3rem;
            }

        .my-gallery .grid .our-project .img a:hover img {
            filter: brightness(1.1) drop-shadow(1px 8px 30px #b1afaf);
        }

        .my-gallery .img {
            padding-bottom: 1.5rem !important;
        }

        .my-gallery .img-fluid {
            max-width: 100%;
            height: auto;
        }

        figure {
            width: initial;
            height: initial;
        }
    </style>

    <!--[header-background]-->
    <section id="start">
        <div class="container-fluid post-background">
            <h2 data-sr='wait 0.5s, then enter left and hustle 100px over 2s'>Our Gallery</h2>
        </div>
    </section>
    <!--[header-background-end]-->
    <div class="my-gallery">
        <div class="container">

            <h2>庆典音乐会</h2>
            <div class="row" style="margin-top: 20px">       
                <div class="testimonial-border"></div>             
                <div class="row grid-1">
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6722.jpg">
                                    <img
                                        src="Images/gallery/5A9A6722.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6727.jpg">
                                    <img
                                        src="Images/gallery/5A9A6727.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6750.jpg">
                                    <img
                                        src="Images/gallery/5A9A6750.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6761.jpg">
                                    <img
                                        src="Images/gallery/5A9A6761.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6783-2.jpg">
                                    <img
                                        src="Images/gallery/5A9A6783-2.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6785.jpg">
                                    <img
                                        src="Images/gallery/5A9A6785.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6789.jpg">
                                    <img
                                        src="Images/gallery/5A9A6789.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6791.jpg">
                                    <img
                                        src="Images/gallery/5A9A6791.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6806.jpg">
                                    <img
                                        src="Images/gallery/5A9A6806.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6821.jpg">
                                    <img
                                        src="Images/gallery/5A9A6821.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6822.jpg">
                                    <img
                                        src="Images/gallery/5A9A6822.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6831.jpg">
                                    <img
                                        src="Images/gallery/5A9A6831.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6835.jpg">
                                    <img
                                        src="Images/gallery/5A9A6835.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6842.jpg">
                                    <img
                                        src="Images/gallery/5A9A6842.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6848.jpg">
                                    <img
                                        src="Images/gallery/5A9A6848.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6858.jpg">
                                    <img
                                        src="Images/gallery/5A9A6858.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6861.jpg">
                                    <img
                                        src="Images/gallery/5A9A6861.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6870.jpg">
                                    <img
                                        src="Images/gallery/5A9A6870.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6884.jpg">
                                    <img
                                        src="Images/gallery/5A9A6884.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6888.jpg">
                                    <img
                                        src="Images/gallery/5A9A6888.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6899.jpg">
                                    <img
                                        src="Images/gallery/5A9A6899.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6906.jpg">
                                    <img
                                        src="Images/gallery/5A9A6906.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6915.jpg">
                                    <img
                                        src="Images/gallery/5A9A6915.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6927.jpg">
                                    <img
                                        src="Images/gallery/5A9A6927.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6946.jpg">
                                    <img
                                        src="Images/gallery/5A9A6946.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6969.jpg">
                                    <img
                                        src="Images/gallery/5A9A6969.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/5A9A6973.jpg">
                                    <img
                                        src="Images/gallery/5A9A6973.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/IMG_1742.jpg">
                                    <img
                                        src="Images/gallery/IMG_1742.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/IMG_1746.jpg">
                                    <img
                                        src="Images/gallery/IMG_1746.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/s1.png">
                                    <img
                                        src="Images/gallery/s1.png"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/s2.png">
                                    <img
                                        src="Images/gallery/s2.png"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item 2020">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/s3.png">
                                    <img
                                        src="Images/gallery/s3.png"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <iframe style="margin: 20px auto" width="560" height="315" src="https://www.youtube.com/embed/REILmDMmjoU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>


            <br />

            <h2>2020春季抗疫献爱心音乐会</h2>
            <div class="row" style="margin-top: 20px">
                <div class="testimonial-border"></div>
                <div class="row grid">              
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/1.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/1.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/4.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/4.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/6.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/6.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/7.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/7.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/2.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/2.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/3.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/3.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/5.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/5.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/15.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/15.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/8.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/8.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/9.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/9.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/10.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/10.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/11.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/11.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/12.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/12.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/13.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/13.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/14.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/14.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/16.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/16.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/17.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/17.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/18.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/18.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/19.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/19.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/20.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/20.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/21.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/21.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/22.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/22.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/23.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/23.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2020-spring/24.jpg">
                                    <img
                                        src="Images/gallery/2020-spring/24.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />

            <h2>2019冬季音乐会</h2>
            <div class="row" style="margin-top: 20px">
                <div class="testimonial-border"></div>
                <div class="row grid">
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/111.jpg">
                                    <img
                                        src="Images/gallery/2019-winter/111.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/222.jpg">
                                    <img
                                        src="Images/gallery/2019-winter/222.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/333.jpg">
                                    <img
                                        src="Images/gallery/2019-winter/333.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/555.jpg">
                                    <img
                                        src="Images/gallery/2019-winter/555.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/666.jpg">
                                    <img
                                        src="Images/gallery/2019-winter/666.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/888.jpg">
                                    <img
                                        src="Images/gallery/2019-winter/888.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/H1.JPG">
                                    <img
                                        src="Images/gallery/2019-winter/H1.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/H2.JPG">
                                    <img
                                        src="Images/gallery/2019-winter/H2.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/H4.JPG">
                                    <img
                                        src="Images/gallery/2019-winter/H4.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/H5.JPG">
                                    <img
                                        src="Images/gallery/2019-winter/H5.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/IMG_6912.JPG">
                                    <img
                                        src="Images/gallery/2019-winter/IMG_6912.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/IMG_8581.JPG">
                                    <img
                                        src="Images/gallery/2019-winter/IMG_8581.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/IMG_8604.JPG">
                                    <img
                                        src="Images/gallery/2019-winter/IMG_8604.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/IMG_8702.JPG">
                                    <img
                                        src="Images/gallery/2019-winter/IMG_8702.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-winter/IMG_8707.JPG">
                                    <img
                                        src="Images/gallery/2019-winter/IMG_8707.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />

            <h2>2019夏季音乐会</h2>
            <div class="row" style="margin-top: 20px">
                <div class="testimonial-border"></div>
                <div class="row grid">
                    
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-summer/IMG_5026.jpg">
                                    <img
                                        src="Images/gallery/2019-summer/IMG_5026.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-summer/IMG_5027.jpg">
                                    <img
                                        src="Images/gallery/2019-summer/IMG_5027.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-summer/IMG_5031.jpg">
                                    <img
                                        src="Images/gallery/2019-summer/IMG_5031.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-summer/IMG_5032.jpg">
                                    <img
                                        src="Images/gallery/2019-summer/IMG_5032.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-summer/IMG_5033.jpg">
                                    <img
                                        src="Images/gallery/2019-summer/IMG_5033.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-summer/IMG_5034.jpg">
                                    <img
                                        src="Images/gallery/2019-summer/IMG_5034.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-summer/IMG_5036.jpg">
                                    <img
                                        src="Images/gallery/2019-summer/IMG_5036.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-summer/IMG_5037.jpg">
                                    <img
                                        src="Images/gallery/2019-summer/IMG_5037.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br />
            <h2>2019纽约卡耐基音乐厅演奏</h2>
            <div class="row" style="margin-top: 20px">
                <div class="testimonial-border"></div>
                <div class="row grid">
                    
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/1.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/1.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/2.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/2.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/3.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/3.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/4.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/4.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/5.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/5.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/6.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/6.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/7.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/7.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/8.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/8.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/9.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/9.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/10.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/10.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/11.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/11.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/12.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/12.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/13.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/13.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/14.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/14.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2019-crescendo/15.jpg">
                                    <img
                                        src="Images/gallery/2019-crescendo/15.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br />
            <h2>2018夏季音乐会</h2>
            <div class="row" style="margin-top: 20px">
                <div class="testimonial-border"></div>
                <div class="row grid">
                    
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/1.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/1.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/2.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/2.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/3.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/3.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/4.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/4.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/5.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/5.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/6.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/6.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/7.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/7.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/8.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/8.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/8.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/8.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/9.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/9.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/10.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/10.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/11.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/11.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/12.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/12.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/13.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/13.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/14.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/14.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/15.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/15.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/16.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/16.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/17.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/17.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/18.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/18.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/19.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/19.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/20.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/20.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/21.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/21.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/22.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/22.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/23.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/23.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/24.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/24.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/25.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/25.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/26.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/26.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/27.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/27.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/28.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/28.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/29.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/29.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/30.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/30.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/31.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/31.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/32.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/32.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/33.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/33.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/34.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/34.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/35.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/35.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/36.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/36.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/37.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/37.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/38.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/38.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/39.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/39.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/40.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/40.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/41.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/41.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/42.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/42.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/43.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/43.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/44.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/44.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/45.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/45.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/2018-summer/46.JPG">
                                    <img
                                        src="Images/gallery/2018-summer/46.JPG"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>

            <br />
            <h2>大师课</h2>
            <div class="row" style="margin-top: 20px">
                <div class="testimonial-border"></div>
                <div class="row grid">
                    
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/1.jpg">
                                    <img
                                        src="Images/gallery/master/1.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/2.jpg">
                                    <img
                                        src="Images/gallery/master/2.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/3.jpg">
                                    <img
                                        src="Images/gallery/master/3.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/4.jpg">
                                    <img
                                        src="Images/gallery/master/4.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/5.jpg">
                                    <img
                                        src="Images/gallery/master/5.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/6.jpg">
                                    <img
                                        src="Images/gallery/master/6.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/7.jpg">
                                    <img
                                        src="Images/gallery/master/7.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/8.jpg">
                                    <img
                                        src="Images/gallery/master/8.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/9.jpg">
                                    <img
                                        src="Images/gallery/master/9.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/10.jpg">
                                    <img
                                        src="Images/gallery/master/10.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/11.jpg">
                                    <img
                                        src="Images/gallery/master/11.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/12.jpeg">
                                    <img
                                        src="Images/gallery/master/12.jpeg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/13.jpeg">
                                    <img
                                        src="Images/gallery/master/13.jpeg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/14.jpeg">
                                    <img
                                        src="Images/gallery/master/14.jpeg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/15.jpeg">
                                    <img
                                        src="Images/gallery/master/15.jpeg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/16.jpg">
                                    <img
                                        src="Images/gallery/master/16.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/19.jpg">
                                    <img
                                        src="Images/gallery/master/19.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/20.jpeg">
                                    <img
                                        src="Images/gallery/master/20.jpeg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/21.jpeg">
                                    <img
                                        src="Images/gallery/master/21.jpeg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/master/22.jpeg">
                                    <img
                                        src="Images/gallery/master/22.jpeg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

            <br />
            <h2>维也纳金色大厅演奏</h2>
            <div class="row" style="margin-top: 20px">
                <div class="testimonial-border"></div>
                <div class="row grid">
                    
                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/1.jpg">
                                    <img
                                        src="Images/gallery/weiyena/1.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/2.jpg">
                                    <img
                                        src="Images/gallery/weiyena/2.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/3.jpg">
                                    <img
                                        src="Images/gallery/weiyena/3.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/4.jpg">
                                    <img
                                        src="Images/gallery/weiyena/4.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/5.jpg">
                                    <img
                                        src="Images/gallery/weiyena/5.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/6.jpg">
                                    <img
                                        src="Images/gallery/weiyena/6.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/7.jpg">
                                    <img
                                        src="Images/gallery/weiyena/7.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/8.jpg">
                                    <img
                                        src="Images/gallery/weiyena/8.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/9.jpg">
                                    <img
                                        src="Images/gallery/weiyena/9.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/10.jpg">
                                    <img
                                        src="Images/gallery/weiyena/10.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/11.jpg">
                                    <img
                                        src="Images/gallery/weiyena/11.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/12.jpg">
                                    <img
                                        src="Images/gallery/weiyena/12.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-12 element-item">
                        <div class="our-project">
                            <div class="img">
                                <a class="test-popup-link" href="Images/gallery/weiyena/13.jpg">
                                    <img
                                        src="Images/gallery/weiyena/13.jpg"
                                        alt="portfolio-1"
                                        class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Scripts/jquery-2.1.1.js"></script>
    <script src="Scripts/isotope.min.js"></script>
    <script src="Scripts/jquery.magnific-popup.min.js"></script>
    <script src="Scripts/gallery.js"></script>
</asp:Content>

