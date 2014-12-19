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



