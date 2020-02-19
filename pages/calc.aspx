<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage <Moneypenny.Web.Models.OutsourcedSwitchboardPageModel>" MasterPageFile="~/Views/Shared/Site.Master" %>
<%@ Import Namespace="Moneypenny.Domain.Reference" %>
<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="title" ContentPlaceHolderID="titleContent" runat="server">
        Outsourced Virtual Switchboard Services | Moneypenny
</asp:Content>

<asp:Content ID="ExtraMeta" ContentPlaceHolderID="ExtraMeta" runat="server">
    <meta name="robots" content="noindex, nofollow">
	<meta name="keywords" content="Outsourced Switchboard, Outsourced Receptionist, Switchboard, Support Services, Dedicated Switchboard, Outstanding Service Levels, Free Trial, Large Businesses." />
    <meta name="description" content="Moneypenny is the leading provider of 24/7 outsourced switchboard solutions. We give you the finest receptionists and technology to improve service levels whilst reducing costs." />
    <link rel="canonical" href="https://www.moneypenny.com/uk/outsourced-switchboard/calculator/" />
    <meta name="twitter:description" content="Moneypenny is the leading provider of 24/7 outsourced switchboard solutions. We give you the finest receptionists and technology to improve service levels whilst reducing costs." />
    <meta name="twitter:title" content="Outsourced Virtual Switchboard Services | Moneypenny" />
    <meta name="twitter:site" content="@Moneypenny" />
    <meta name="twitter:creator" content="@Moneypenny"/>
    <meta name="twitter:card" content="summary_large_image" />
    <link href="https://assets.calendly.com/assets/external/widget.css" rel="stylesheet">
    <script src="https://assets.calendly.com/assets/external/widget.js" type="text/javascript"></script>

</asp:Content>

<asp:Content runat="server" ID="Css" ContentPlaceHolderID="CssContent">
    <%: Styles.Render("~/globalCSS/") %>
    <%: Styles.Render("~/CalculatorCss/") %>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div id="switchboardCalc">

        <section id="hero" class="hero-calc">
                <div class="content">
                    <h1 class="content__title">What is your switchboard really costing you?</h1>
                    <p class="content__desc">Input your data (or use national averages) to find out exactly how much.</p>
                </div>
        </section>

        <div class="container">

            <section id="data" class="data">
                <h3 class="data-title" id="dataTitle">Calculate the true cost</h3>
                <ul class="data-form">
                    <li class="data-form__question">
                        <h3 class="data-form__question__title">How many switchboard operators do you employ?</h3>
                        <div class="data-form__question__info">i</div>
                        <p class="data-form__question__desc">Enter any part-time staff as a fraction e.g. 2.5.</p>
                        <input type="text" onfocus="this.value=''" class="data-form__question__text" id="staffNo"/>
                        <div class="error" id="staffError">Please enter a valid number</div>
                    </li>
                    <li class="data-form__question">
                        <h3 class="data-form__question__title">What is the base salary of your switchboard operators?</h3>
                        <div class="data-form__question__info">i</div>
                        <p class="data-form__question__desc">According to Totaljobs, the average salary for a London-based receptionist is £23,000.</p>
                        <label class="data-form__question__money">£</label>
                        <input type="text" onfocus="this.value=''" class="data-form__question__text data-form__question__text--padding" id="salary"/>
                        <div class="error" id="salaryError">Please enter a valid number</div>
                    </li>
                    <li class="data-form__question">
                        <h3 class="data-form__question__title">National Insurance</h3>
                        <div class="data-form__question__info">i</div>
                        <p class="data-form__question__desc">0% for the first £8268 of earnings, 13.8% applied thereafter.</p>
                        <div class="data-form__question__text data-form__question__text--only" id="NI"></div>
                        <label class="data-form__question__only">£</label>
                    </li>
                    <li class="data-form__question">
                        <h3 class="data-form__question__title">How much do you contribute to their pension?</h3>
                        <div class="data-form__question__info">i</div>
                        <p class="data-form__question__desc">According to AON’s Benefits and Trends survey the average employer contribution is 5.6%. For most employers the statutory minimum is 3%.</p>
                        <div id="pension">
                            <div id="pensionHandle" class="ui-slider-handle">5%</div>
                            <span class="sliderLabel sliderLabel--zero">0%</span>
                            <span class="sliderLabel sliderLabel--1"></span>
                            <span class="sliderLabel sliderLabel--2"></span>
                            <span class="sliderLabel sliderLabel--3"></span>
                            <span class="sliderLabel sliderLabel--4"></span>
                            <span class="sliderLabel sliderLabel--5"></span>
                            <span class="sliderLabel sliderLabel--6"></span>
                            <span class="sliderLabel sliderLabel--7"></span>
                            <span class="sliderLabel sliderLabel--8"></span>
                            <span class="sliderLabel sliderLabel--9"></span>
                            <span class="sliderLabel sliderLabel--10">10%</span>
                        </div>
                    </li>
                    <li class="data-form__question">
                        <h3 class="data-form__question__title">How much are other benefits worth?</h3>
                        <div class="data-form__question__info">i</div>
                        <p class="data-form__question__desc">According to HMRC statistics , the average value of taxable benefits is 8.6% of salary. For example, health insurance, subsidised lunches, gym memberships, loyalty reward programmes.</p>
                        <div id="benefits">
                            <div id="benefitsHandle" class="ui-slider-handle">9%</div>
                            <span class="sliderLabel sliderLabel--zero">0%</span>
                            <span class="sliderLabel sliderLabel--1"></span>
                            <span class="sliderLabel sliderLabel--2"></span>
                            <span class="sliderLabel sliderLabel--3"></span>
                            <span class="sliderLabel sliderLabel--4"></span>
                            <span class="sliderLabel sliderLabel--5"></span>
                            <span class="sliderLabel sliderLabel--6"></span>
                            <span class="sliderLabel sliderLabel--7"></span>
                            <span class="sliderLabel sliderLabel--8"></span>
                            <span class="sliderLabel sliderLabel--9"></span>
                            <span class="sliderLabel sliderLabel--10">10%</span>
                        </div>
                    </li>
                    <li class="data-form__question">
                        <h3 class="data-form__question__title">How much time do you spend per person on training and management per week?</h3>
                        <div class="data-form__question__info">i</div>
                        <p class="data-form__question__desc">A 2014 study by Leadership IQ found that the optimal amount of time to spend interacting with one’s leader is 6 hours.</p>
                        <label class="data-form__question__hours">hrs</label>
                        <input type="text" onfocus="this.value=''" class="data-form__question__text" id="time"/>
                        <div class="error" id="timeError">Please enter a valid number</div>
                    </li>
                    <li class="data-form__question">
                        <h3 class="data-form__question__title">How much do spend on infrastructure to support each operator per year?</h3>
                        <div class="data-form__question__info">i</div>
                        <p class="data-form__question__desc">The IPD Blue Chip Office Index put the average total cost of office space and equipment per occupant at £4,800.</p>
                        <label class="data-form__question__money">£</label>
                        <input type="text" onfocus="this.value=''" class="data-form__question__text data-form__question__text--padding" id="expenses"/>
                        <div class="error" id="expensesError">Please enter a valid number</div>
                    </li>
                </ul>
            </section>

            <section id="results" class="results">
                <div class="results-box" id="resultsBox">
                    <img class="results-box__PA" src="https://res.cloudinary.com/moneypenny/image/upload/f_auto/v1/Calculators/Group_1161.png"/>
                    <div class="results-box__result">
                        <p class="results-box__result__text">
                            Your switchboard costs...<br />
                            <span id="finalAmount">£0</span>
                        </p>
                    </div>
                    <p class="results-box__text">Outsource some or all of your switchboard calls to Moneypenny to save between 30-60%.</p>
                    <button onclick="Calendly.initPopupWidget({url: 'https://calendly.com/moneypennyuk/consultation'});return false;" class="results-box__btn">Book a consultation</button>
                    <a href="<%= Url.Action("Index", "OutsourcedSwitchboard") %>" class="results-box__btn">Discover our switchboard solutions</a>
                </div>
                
            </section>
        </div>
        <section class="benefits" id="benefitsBox">
                    <ul class="benefit-list">
                        <li class="benefit-list__item">
                            <img src="https://res.cloudinary.com/moneypenny/image/upload/Calculators/Group_1178.svg" />
                            <p>Gain seamless 24/7 switchboard and business continuity provision.</p>
                        </li>
                        <li class="benefit-list__item">
                            <img src="https://res.cloudinary.com/moneypenny/image/upload/Calculators/Group_1181.svg" />
                            <p>Scale our support instantly according to demand, so you’re never overstaffed.</p>
                        </li>
                        <li class="benefit-list__item">
                            <img src="https://res.cloudinary.com/moneypenny/image/upload/Calculators/Group_1183.svg" />
                            <p>Improve your customer journey and guarantee agreed SLAs.</p>
                        </li>
                        <li class="benefit-list__item">
                            <img src="https://res.cloudinary.com/moneypenny/image/upload/Calculators/Group_1219.svg" />
                            <p>Give management back their time, release equipment and office space.</p>
                        </li>
                        <li class="benefit-list__item">
                            <img src="https://res.cloudinary.com/moneypenny/image/upload/Calculators/Group_1221.svg" />
                            <p>Access world-class speech technology to streamline your switchboard further.</p>
                        </li>
                    </ul>
                </section>
        <section id="quote" class="quote">
            <div class="container">
            <h2 class="heading">Trusted by thousands of businesses</h2>
            <div class="quote-wrapper">
              <div class="quotes">
                <div class="quotes__image quotes__image--start"></div>
                <p class="quotes__text">Moneypenny’s ability to understand the needs of callers is impressive.</p>
                <div class="quotes__credit">
                    <p>Matthew Foy Assistant Manager, RSM UK</p>
                    <img src="https://res.cloudinary.com/moneypenny/image/upload/v1/Calculators/Image_60.png" />
                </div>
              </div>
              <div class="quotes">
                <div class="quotes__image quotes__image--start"></div>
                <p class="quotes__text">I would absolutely recommend Moneypenny to other businesses, the quality of the service is amazing.</p>
                <div class="quotes__credit">
                    <p>Joanna Giles Head of Facilities, Cooper Parry</p>
                    <img src="https://res.cloudinary.com/moneypenny/image/upload/f_auto/Calculators/Image_61.png" />
                </div>
              </div>
              <div class="quotes">
                <div class="quotes__image quotes__image--start"></div>
                <p class="quotes__text">I don’t give praise easily, but Moneypenny is excellent.</p>
                <div class="quotes__credit">
                    <p>Danny Sacco Managing Director, Mazda Lansdown</p>
                    <img src="https://res.cloudinary.com/moneypenny/image/upload/v1/Calculators/Image_56.png" />
                </div>
              </div>
            </div>
            <div class="quotes-mobile-wrapper">
                <div class="quote-marks quote-marks--start"></div>
                <div class="quote-slider">
                  <div class="quote-mobile">
                    <p class="quote-mobile__text">Moneypenny’s ability to understand the needs of callers is impressive.</p>
                    <div class="quote-mobile__credit">
                        <p>Matthew Foy Assistant Manager, RSM UK</p>
                        <img src="https://res.cloudinary.com/moneypenny/image/upload/v1/Calculators/Image_60.png" />
                    </div>
                  </div>
                  <div class="quote-mobile">
                    <p class="quote-mobile__text">I would absolutely recommend Moneypenny to other businesses, the quality of the service is amazing.</p>
                    <div class="quote-mobile__credit">
                        <p>Joanna Giles Head of Facilities, Cooper Parry</p>
                        <img src="https://res.cloudinary.com/moneypenny/image/upload/f_auto/Calculators/Image_61.png" height="50px" />
                    </div>
                  </div>
                  <div class="quote-mobile">
                    <p class="quote-mobile__text">I don’t give praise easily, but Moneypenny is excellent.</p>
                    <div class="quote-mobile__credit">
                        <p>Danny Sacco Managing Director, Mazda Lansdown</p>
                        <img src="https://res.cloudinary.com/moneypenny/image/upload/v1/Calculators/Image_56.png" />
                    </div>
                  </div>
                </div>
              </div>
            
                <div class="trustpilot">
                    <img src="https://res.cloudinary.com/moneypenny/image/upload/f_auto/v1/misc/logo-white.svg" class="trustpilot__image trustpilot__image--top" />
                    <p class="trustpilot__text">Excellent</p>
                    <img src="https://res.cloudinary.com/moneypenny/image/upload/f_auto/v1/misc/5-stars.png" class="trustpilot__image" />
                </div>
              </div>  
        </section>

    </div>
</asp:Content>

<asp:Content runat="server" ID="Script" ContentPlaceHolderID="ScriptContent">
    <%: Scripts.Render("~/CalculatorJs/")%>
</asp:Content>