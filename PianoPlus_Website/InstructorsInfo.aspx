<%@ Page Title="" Language="C#" MasterPageFile="~/WebMaster.master" AutoEventWireup="true" CodeFile="InstructorsInfo.aspx.cs" Inherits="InstructorsInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        p {
            color: GrayText;
            margin-bottom: 5px;
            font-size: 16px;
        }
    </style>

    <!--[header-background]-->
    <section id="start">
        <div class="container-fluid post-background">
            <h2 data-sr='wait 0.5s, then enter left and hustle 100px over 2s'>Our Instructors</h2>
        </div>
    </section>
    <!--[header-background-end]-->

    <div class="container">
        <div class="row" data-sr='wait 0.1s, then enter left and hustle 55px over 1.5s' style="margin-top: 20px">
            <div class="testimonial-border"></div>
            <div class="col-md-4">
                <img src="Images/works/13.jpg" alt="instructor pic" width="100%" style="margin-top: 25px" />
            </div>
            <div class="col-md-8">
                <h3><b>Name: Yiming Huan</b></h3>
                <h4><b>Education Background:</b> Master's degree (Piano Performance)</h4>
                <h4><b>Research Area:</b> Piano teaching and research</h4>
                <br />

                <p>1. Pianist and educator, sat under many famous national and international pianists: Mr. Jacques Després (French), Ms. Patricia Tao (American), Mr. Zhe Bang Xie and Ms. Mei Ge Li </p>
                <p>2. Graduated from University of Alberta, which ranked Top 5 in Canada and Top 100 in the world. Achieved Master’s Degree in Piano Performance, with full scholarship</p>
                <p>3. The Gold Award winner of Chinese National Piano Competition</p>
                <p>4. The Gold Award winner of Shanghai International Music Competition</p>
                <p>5. RCM certified top tier teacher</p>
                <p>6. The Top 100 Excellent Guide Teacher Award from the “Concerned about the next generation committee” of the State Council</p>
                <p>7. Taught piano in Conservatory of Music in China</p>
                <p>8. Guest performer for Shanghai Gufan Symphony Orchestra</p>
                <p>9. Guest performer for the Women’s Orchestra of Jiangsu province</p>
                <p>10. A distinguished performer of the piano brand “Bentley”</p>
                <p>11. Selected into the (Famous Artists of China) national stamp series by CHINA POST together with other respected famous musicians like Zheng Xiaoying, Gao Shaoqing and Tian Jiaxin</p>
                <p>12. A member of the “Golden Key International Honor Society”</p>
                <p>13. Founder of HYMUSIC education group</p>
                <p>14. Rich experience in Piano performance. Has the honor to perform in the Golden Hall of Vienna during Spring Festival 2019</p>
                <p>15. Students have made a lot of achievements including many First places and second places in all kinds of music competitions, many First class in RCM exams, being invited to perform in Carnegie Hall in New York, First place together with scholarship in American International Music Competition</p>
                <p>16. Good at music education and interest education. With her guidance, students all love music, love piano, love and enjoy lives</p>

            </div>

        </div>

        <div class="row" data-sr='wait 0.1s, then enter left and hustle 55px over 1.5s' style="margin: 20px 0 60px 0">
            <div class="testimonial-border" style="margin-top: 20px"></div>

            <div class="col-md-8">
                <%-- <h3><b>Name: Fiona Wong</b></h3>
                <h4><b>Education Background:</b> Communications and Minor in Music</h4>

                <br />
                <p>
                    Fiona Wong started playing piano since she was five years old, and started to take professional classical music lessons when she was twelve years old. 
                    She has completed all levels of piano, theory, history and harmony through the Royal Conservatory School of Music. 
                    She has performed in several Music Workshops and was awarded second place for the Vancouver Kiwanis Music Festival in 2015.</p>

                <p>
                    Fiona graduated from Simon Fraser University with a Majors in Communications and Minor in Music. 
                    With her musical education at Simon Fraser University, she learned contemporary musical genres, including jazz, electro-acoustic music, and much more- which widen her perspective of music.
                </p>

                <p>
                    Fiona has volunteered performing in senior homes in the lower mainland and conducting music lessons in pre-schools. 
                    Further to her education, Fiona has been teaching music for over 7 years, and is experience with teaching classical and contemporary music styles to people of all ages.
                </p>--%>
                <h3><b>宦一铭</b></h3>

                <p>1、	青年钢琴演奏家、钢琴教育家，师从Jacques Després（法）、Patricia Tao（美）、谢哲邦、李美格等国内外著名钢琴家。</p>
                <p>
                    2、	毕业于加拿大前五、世界前百的University of Alberta大学，以全额奖学金获得钢琴表演硕士学位。
                </p>
                <p>
                    3、	中国红全国钢琴比赛金奖。
                </p>
                <p>
                    4、	上海国际青年钢琴比赛金奖。
                </p>
                <p>
                    5、	北美RCM考级协会认证TOP TIER顶级教师。
                </p>
                <p>
                    6、	中国“关心下一代”授予TOP 100全国优秀指导教师。
                </p>
                <p>
                    7、	任职于国内本科类音乐学院教授钢琴。
                </p>
                <p>
                    8、	上海古凡交响乐团钢琴演奏家
                </p>
                <p>
                    9、	江苏女子交响乐团钢琴演奏家
                </p>
                <p>
                    10、	宾利钢琴签约演奏家
                </p>
                <p>
                    11、	入选中国邮政总局发行的《中国文化名家》系列邮票，同期入选的还有郑小瑛、高韶青和田佳鑫等著名音乐家。
                </p>
                <p>
                    12、	金钥匙国际荣誉协会会员
                </p>
                <p>
                    13、	HYMUSIC教育集团创始人
                </p>
                <p>
                    14、	钢琴演奏经历丰富，即将于2019年新春在维也纳金色大厅演奏
                </p>
                <p>
                    15、	学生们成绩斐然，在RCM考级和各种音乐比赛中纷获金奖和银奖，还应邀在纽约卡耐基音乐厅演奏。并在美国国际音乐大赛中获得一等奖及奖学金的优异成绩。
                </p>
                <p>
                    16、	长于音乐教育与素质教育的结合，在宦老师的引导下，学生们都爱上音乐爱上钢琴，热爱并享受生活。
                </p>


            </div>
            <div class="col-md-4">
                <img src="Images/works/2.JPG" alt="instructor pic" width="100%" style="margin-top: 25px" />
            </div>
        </div>

        <div class="row" data-sr='wait 0.1s, then enter left and hustle 55px over 1.5s' style="margin-top: 20px">
            <div class="testimonial-border"></div>
            <div class="col-md-4">
                <img src="Images/works/18.jpg" alt="instructor pic" width="100%" style="margin-top: 25px" />
            </div>
            <div class="col-md-4">
                <img src="Images/works/19.jpg" alt="instructor pic" width="100%" style="margin-top: 25px" />
            </div>
            <div class="col-md-4">
                <img src="Images/works/20.jpg" alt="instructor pic" width="100%" style="margin-top: 25px" />
            </div>
            <div class="col-md-4">
                <img src="Images/works/21.jpg" alt="instructor pic" width="100%" style="margin-top: 25px" />
            </div>
            <div class="col-md-4">
                <img src="Images/works/22.jpg" alt="instructor pic" width="100%" style="margin-top: 25px" />
            </div>
        </div>
        <br />
    </div>

    <script src="Scripts/jquery-2.1.1.js"></script>
</asp:Content>

