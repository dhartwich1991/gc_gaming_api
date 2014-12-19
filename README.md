gCGaming API
=============

This is the official API of the gCGaming Raiding Guild on Frostwolf - EU

Below a list of calls is listed in order to document the API

### Register a new User
<pre><code>(POST) http://dotards.net:3000/api/v1/users/register
</code></pre> 
<table>
  <tr>
    <td>Parameter</td>
    <td>Description</td>
    <td>Example</td>
  </tr>
    <tr>
    <td>username</td>
    <td>This is the username of a user</td>
    <td>Testuser</td>
  </tr>
    <tr>
    <td>password</td>
    <td>This represents the password of a user (will be Base64 encoded)</td>
    <td>Testpassword</td>
  </tr>
    <tr>
    <td>email</td>
    <td>This is the E-Mail Address of a user and can be used to send mails</td>
    <td>testuser@testteam.com</td>
  </tr>
</table>

### Login a User
<pre><code>(POST) http://dotards.net:3000/api/v1/users/login
</code></pre> 
<table>
  <tr>
    <td>Parameter</td>
    <td>Description</td>
    <td>Example</td>
  </tr>
    <tr>
    <td>username</td>
    <td>Username of the user logging in</td>
    <td>Testuser</td>
  </tr>
    <tr>
    <td>password</td>
    <td>Password of the user logging in</td>
    <td>Testpassword</td>
  </tr>
</table>

###Possible Response Codes
These Codes are stored in the 'code' variable of the returned JSON in POST Requests
<table>
  <tr>
    <td>Code</td>
    <td>Description</td>
    <td>Example</td>
  </tr>
  <tr>
    <td>0</td>
    <td>Successful Event</td>
    <td>User was created succesfully</td>
  </tr>
  <tr>
    <td>1</td>
    <td>Nil Error Event</td>
    <td>Requested User doesn't exist</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Wrong Data Error</td>
    <td>Wrong password was entered</td>
  </tr>
</table>



