# Super Marios's Market :convenience_store:
## By Adrian Camacho :electric_plug:

---

### Project Description :pencil:

* This project is an application that allows users to view products for a grocery store and reviews to them.

* If the user is an admin, it allows them to add, delete and update both products and reviews!
---
### Tech Stack :floppy_disk:
1. _Ruby 2.6.3_
2. _Rails 6.1.4_
3. _Node.js_
4. _Ruby gems_
5. _HTML_
6. _Bootstrap_
7. _Scss_
8. _Sass_
9. _BCrypt_
---
### Installation Instructions :pushpin:
1. Clone this repo: `https://github.com/chonnessey/super_mario.git`
2. Enter new directory `cd directory`
3. Install dependencies with the `bundle` command.
4. To set up a server side database run the command `rake db:create` when in the project directory.
5. To run the Rails local server run the command `rails s` and then navigate to `localhost:3000`.
6. Create an account by clicking the sign up link on the homepage.
7. If you would like to give yourself admin access you can do so in the rails console. Run the command `rails c` to enter the console.
8. Find the user you created and look for the id by running `User.all`.
9. Once you find your id, save it into a variable ie: `admin = User.find(1)`.
10. Update your admin attribute to true like this `admin.update({:admin => "true"})`
11. Finally save your updated admin object with the command `admin.save` and you should be good to go!
12. To run tests, run the command `rspec` in the project directory.
13. Fill out the forms and have fun!
---
### Known Bugs :bug:
1. No Known Bugs.
2. Please open a pull request if you have any issues!
---
### Test Suite/Specification :chart_with_upwards_trend:

> See [spec folder](https://github.com/chonnessey/super_mario/tree/main/spec) for rspec test suite which includes 21 passing tests. View test results from project directory by running `rspec`.
---
### Contact Info :inbox_tray:

You can reach me at: <adriancamacho18@gmail.com> :rocket:
___
### License is GPLv3 and I make no claim to copyright. :guardsman:
<br />

> You can't steal what is freely given. Enjoy!

<br />
<br />
<br />
<br />
<p align="center">
  <small>Made in Portland, Oregon.</small>
</p>
