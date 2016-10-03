<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<%@ page
	import="org.springframework.security.core.AuthenticationException"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" href="resources/style/login.css" />
<title>Registration</title>
<style type="text/css">
.error {
	font-size: 14px;
	font-color: #ff0000;
	font-family: sans-serif;
	margin-top: 5px;
	margin-bottom: 5px;
}
</style>
</head>
<body class="body">
	<div class="wrapper">
		<div class="loginHeader"></div>
		<div class="registerContainer">

			<div class="loginText">
				<label>Registration</label>
			</div>
			<form:form action="newRegistrationSubmit.htm" method="POST"
				commandName="customer">
				<c:if test="${not empty customer.name}">
					<form:hidden path="id" value="${customer.id}" />
				</c:if>
				<div class="username">
					<div>
						<form:errors path="name" cssClass="error" />
					</div>
					<div class="registerLabelTxtBox">
						<label>Full Name:</label>
					</div>
					<div class="textbox">
						<form:input path="name" value="${customer.name}" type="text" />
					</div>
				</div>

				<div class="username">
					<div>
						<form:errors path="username" cssClass="error" />
					</div>
					<div class="registerLabelTxtBox">
						<label>Username:</label>
					</div>
					<div class="textbox">
						<form:input id="username" path="username"
							value="${customer.username}" type="text" />
					</div>
				</div>

				<div class="username">
					<div>
						<form:errors path="password" cssClass="error" />
					</div>
					<div class="registerLabelTxtBox">
						<label>Password:</label>
					</div>
					<div class="textbox">
						<form:password id="password" path="password"
							value="${customer.password}" type="password" />
					</div>
				</div>
				<div class="username">
					<div>
						<form:errors path="confirmPassword" cssClass="error" />
					</div>
					<div class="registerLabelTxtBox">
						<label>Confirm Password: </label>
					</div>
					<div class="textbox">
						<form:password id="confirmPassword" path="confirmPassword"
							value="${customer.confirmPassword}" type="password" />
					</div>
				</div>

				<div class="username">
					<div>
						<form:errors path="email" cssClass="error" />
					</div>
					<div class="registerLabelTxtBox">
						<label>Email Address:</label>
					</div>
					<div class="textbox">
						<form:input id="email" path="email" value="${customer.email}"
							type="text" />
					</div>
				</div>

				<div class="username">
					<div>
						<form:errors path="phoneNo" cssClass="error" />
					</div>
					<div class="registerLabelTxtBox">
						<label>Phone No:</label>
					</div>
					<div class="textbox">
						<form:input id="phoneNo" path="phoneNo"
							value="${customer.phoneNo}" type="text" />
					</div>
				</div>

				<div class="username">
					<div>
						<form:errors path="address" cssClass="error" />
					</div>
					<div class="registerLabelTxtBox">
						<label>Address:</label>
					</div>
					<div class="textbox">
						<form:input id="address" path="address"
							value="${customer.address}" type="text" />
					</div>
				</div>
				<div class="username">
					<div class="registerLabelTxtBox">
						<label>Company(if any):</label>
					</div>
					<div class="textbox">
						<form:input id="company" path="company"
							value="${customer.company}" type="text" />
					</div>
				</div>

				<div class="username">
					<div>
						<form:errors path="province" cssClass="error" />
					</div>
					<div class="registerLabelTxtBox">
						<label>State/Region: </label>
					</div>
					<div class="textbox">
						<form:input id="province" path="province"
							value="${customer.province}" type="text" />
					</div>
				</div>
				<div class="username">
					<div>
						<form:errors path="country" cssClass="error" />
					</div>
					<div class="registerLabelTxtBox">
						<label>Country:</label>
					</div>
					<select name="country" class="textbox">
						<option>Afghanistan</option>
						<option>Albania</option>
						<option>Algeria</option>
						<option>American Samoa</option>
						<option>Andorra</option>
						<option>Angola</option>
						<option>Anguilla</option>
						<option>Antarctica</option>
						<option>Antigua and Barbuda</option>
						<option>Argentina</option>
						<option>Armenia</option>
						<option>Aruba</option>
						<option>Australia</option>
						<option>Austria</option>
						<option>Azerbaijan</option>
						<option>Bahamas</option>
						<option>Bahrain</option>
						<option>Bangladesh</option>
						<option>Barbados</option>
						<option>Belarus</option>
						<option>Belgium</option>
						<option>Belize</option>
						<option>Benin</option>
						<option>Bermuda</option>
						<option>Bhutan</option>
						<option>Bolivia</option>
						<option>Bosnia and Herzegowina</option>
						<option>Botswana</option>
						<option>Bouvet Island</option>
						<option>Brazil</option>
						<option>British Indian Ocean Territory</option>
						<option>Brunei Darussalam</option>
						<option>Bulgaria</option>
						<option>Burkina Faso</option>
						<option>Burundi</option>
						<option>Cambodia</option>
						<option>Cameroon</option>
						<option>Canada</option>
						<option>Cape Verde</option>
						<option>Cayman Islands</option>
						<option>Central African Republic</option>
						<option>Chad</option>
						<option>Channel Islands</option>
						<option>Chile</option>
						<option>China</option>
						<option>Christmas Island</option>
						<option>Cocos (Keeling) Islands</option>
						<option>Colombia</option>
						<option>Comoros</option>
						<option>Congo</option>
						<option>Cook Islands</option>
						<option>Costa Rica</option>
						<option>Cote D'Ivoire</option>
						<option>Croatia</option>
						<option>Cuba</option>
						<option>Cyprus</option>
						<option>Czech Republic</option>
						<option>Democratic Republic of Congo</option>
						<option>Denmark</option>
						<option>Djibouti</option>
						<option>Dominica</option>
						<option>Dominican Republic</option>
						<option>East Timor</option>
						<option>Ecuador</option>
						<option>Egypt</option>
						<option>El Salvador</option>
						<option>Equatorial Guinea</option>
						<option>Eritrea</option>
						<option>Estonia</option>
						<option>Ethiopia</option>
						<option>Falkland Islands (Malvinas)</option>
						<option>Faroe Islands</option>
						<option>Fiji</option>
						<option>Finland</option>
						<option>France</option>
						<option>France, Metropolitan</option>
						<option>French Guiana</option>
						<option>French Polynesia</option>
						<option>French Southern Territories</option>
						<option>Gabon</option>
						<option>Gambia</option>
						<option>Georgia</option>
						<option>Germany</option>
						<option>Ghana</option>
						<option>Gibraltar</option>
						<option>Greece</option>
						<option>Greenland</option>
						<option>Grenada</option>
						<option>Guadeloupe</option>
						<option>Guam</option>
						<option>Guatemala</option>
						<option>Guinea</option>
						<option>Guinea-bissau</option>
						<option>Guyana</option>
						<option>Haiti</option>
						<option>Heard and Mc Donald Islands</option>
						<option>Honduras</option>
						<option>Hong Kong</option>
						<option>Hungary</option>
						<option>Iceland</option>
						<option>India</option>
						<option>Indonesia</option>
						<option>Iran (Islamic Republic of)</option>
						<option>Iraq</option>
						<option>Ireland</option>
						<option>Israel</option>
						<option>Italy</option>
						<option>Jamaica</option>
						<option>Japan</option>
						<option>Jordan</option>
						<option>Kazakhstan</option>
						<option>Kenya</option>
						<option>Kiribati</option>
						<option>Korea, Republic of</option>
						<option>Kuwait</option>
						<option>Kyrgyzstan</option>
						<option>Lao People's Democratic Republic</option>
						<option>Latvia</option>
						<option>Lebanon</option>
						<option>Lesotho</option>
						<option>Liberia</option>
						<option>Libyan Arab Jamahiriya</option>
						<option>Liechtenstein</option>
						<option>Lithuania</option>
						<option>Luxembourg</option>
						<option>Macau</option>
						<option>Macedonia</option>
						<option>Madagascar</option>
						<option>Malawi</option>
						<option>Malaysia</option>
						<option>Maldives</option>
						<option>Mali</option>
						<option>Malta</option>
						<option>Marshall Islands</option>
						<option>Martinique</option>
						<option>Mauritania</option>
						<option>Mauritius</option>
						<option>Mayotte</option>
						<option>Mexico</option>
						<option>Micronesia, Federated States of</option>
						<option>Moldova, Republic of</option>
						<option>Monaco</option>
						<option>Mongolia</option>
						<option>Montserrat</option>
						<option>Morocco</option>
						<option>Mozambique</option>
						<option>Myanmar</option>
						<option>Namibia</option>
						<option>Nauru</option>
						<option>Nepal</option>
						<option>Netherlands</option>
						<option>Netherlands Antilles</option>
						<option>New Caledonia</option>
						<option>New Zealand</option>
						<option>Nicaragua</option>
						<option>Niger</option>
						<option>Nigeria</option>
						<option>Niue</option>
						<option>Norfolk Island</option>
						<option>North Korea</option>
						<option>Northern Mariana Islands</option>
						<option>Norway</option>
						<option>Oman</option>
						<option>Pakistan</option>
						<option>Palau</option>
						<option>Panama</option>
						<option>Papua New Guinea</option>
						<option>Paraguay</option>
						<option>Peru</option>
						<option>Philippines</option>
						<option>Pitcairn</option>
						<option>Poland</option>
						<option>Portugal</option>
						<option>Puerto Rico</option>
						<option>Qatar</option>
						<option>Reunion</option>
						<option>Romania</option>
						<option>Russian Federation</option>
						<option>Rwanda</option>
						<option>Saint Kitts and Nevis</option>
						<option>Saint Lucia</option>
						<option>Saint Vincent and the Grenadines</option>
						<option>Samoa</option>
						<option>San Marino</option>
						<option>Sao Tome and Principe</option>
						<option>Saudi Arabia</option>
						<option>Senegal</option>
						<option>Seychelles</option>
						<option>Sierra Leone</option>
						<option>Singapore</option>
						<option>Slovak Republic</option>
						<option>Slovenia</option>
						<option>Solomon Islands</option>
						<option>Somalia</option>
						<option>South Africa</option>
						<option>South Georgia &amp; South Sandwich Islands</option>
						<option>Spain</option>
						<option>Sri Lanka</option>
						<option>St. Helena</option>
						<option>St. Pierre and Miquelon</option>
						<option>Sudan</option>
						<option>Suriname</option>
						<option>Svalbard and Jan Mayen Islands</option>
						<option>Swaziland</option>
						<option>Sweden</option>
						<option>Switzerland</option>
						<option>Syrian Arab Republic</option>
						<option>Taiwan</option>
						<option>Tajikistan</option>
						<option>Tanzania, United Republic of</option>
						<option>Thailand</option>
						<option>Togo</option>
						<option>Tokelau</option>
						<option>Tonga</option>
						<option>Trinidad and Tobago</option>
						<option>Tunisia</option>
						<option>Turkey</option>
						<option>Turkmenistan</option>
						<option>Turks and Caicos Islands</option>
						<option>Tuvalu</option>
						<option>Uganda</option>
						<option>Ukraine</option>
						<option>United Arab Emirates</option>
						<option>United Kingdom</option>
						<option selected="selected">United States</option>
						<option>United States Minor Outlying Islands</option>
						<option>Uruguay</option>
						<option>Uzbekistan</option>
						<option>Vanuatu</option>
						<option>Vatican City State (Holy See)</option>
						<option>Venezuela</option>
						<option>Viet Nam</option>
						<option>Virgin Islands (British)</option>
						<option>Virgin Islands (U.S.)</option>
						<option>Wallis and Futuna Islands</option>
						<option>Western Sahara</option>
						<option>Yemen</option>
						<option>Yugoslavia</option>
						<option>Zambia</option>
						<option>Zimbabwe</option>
					</select>
				</div>
				<div class="username">
					<div class="registerLabelTxtBox">
						<label>Shipping Address(if different):</label>
					</div>
					<div class="textbox">
						<form:input id="shippingAddress" path="shippingAddress"
							value="${customer.shippingAddress}" type="text" />
					</div>
				</div>
				<div class="username">
					<div class="registerLabelTxtBox">
						<input type="checkbox" name="selected" onclick=""
						value="" /><label>I have read and agree to the <a href="#">Privacy Policy</a></label>
					</div>
				</div>
				<div class="submit">
					<input id="addRegistration" type="submit" value="" />
				</div>
			</form:form>
		</div>
		<div class="footer">@copyright locksa2z 2011</div>
	</div>
</body>
</html>