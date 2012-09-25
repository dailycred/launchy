# Launchy by [Dailycred](https://www.dailycred.com)

##### Launchy is the quickest way to get a landing page up and running that is functional and fully customizeable with a robust authentication system. View a [demo site](http://launchy.herokuapp.com/).

######Prerequisites

To make full use of this, you must have installed [git](http://git-scm.com/downloads), [ruby on rails](http://rubyonrails.org/download) (version 3.2, with ruby version 1.9), and the [heroku toolbelt](https://toolbelt.herokuapp.com/) (for deployment). You also need a (free) account for [dailycred](https://www.dailycred.com) to handle authentication.
<!--To get started, first [sign up for dailycred](https://www.dailycred.com). Make sure you've also created a [facebook application](https://developers.facebook.com/apps) and a (twitter application)[https://dev.twitter.com/apps] so that you can integrate twitter and facebook connect into your application. Once you have your API keys ready, head over to your [settings page](https://www.dailycred.com/admin/setup) and add them to your account. Once that's all set up, open your terminal and run:-->
To get started, simply open your terminal and run:

	git clone git@github.com:hstove/launchy.git
	
Open up the newly downloaded 'launchy' folder in your favorite text editor, and open up the file `config/initializers/omniauth.rb`. Change the first two lines to use your dailycred API keys, located on your [account page](https://www.dailycred.com/admin/settings). Replace the default `YOUR_CLIENT_ID` and `YOUR-CLIENT-SECRET` with your api keys. The first two lines should look something like this before you change them:

	Rails.configuration.DAILYCRED_CLIENT_ID = ENV['dc_id'] || "YOUR-CLIENT-ID"
	Rails.configuration.DAILYCRED_SECRET_KEY = ENV['dc_secret'] || "YOUR-CLIENT-SECRET"
	
Finally, run `rails s` and open your browser to <http://localhost:3000>.

You're all set! You have a fully running landing page where users can create real accounts and sign up with facebook and twitter. This has an advantage over other email-only options in that you can get a better idea of who your users are. Also, if you decide to build out a real application, you can keep all the same users who have already signed up for you.

###Customization

######Background Url

There are three preset options for the background image. open `app/assets/stylesheets/welcome.css.sass`. Around line 8, you should see these lines: 

	  //all photos are Creative Commons attribution license
	  //:background-image url('/assets/bg2.jpeg') //photo cred: <a href="http://www.flickr.com/photos/62313790@N00/">ilya_ktsn</a>
	  :background-image url('/assets/bg3.jpeg') //photo cred: <a href="http://www.flickr.com/photos/62313790@N00/">ilya_ktsn</a>
	  //:background-image url('/assets/bg.jpeg') //photo cred: <a href="http://www.flickr.com/photos/bnsd/">Bengt Nyman</a></p>
	  
Feel free to comment out one line and un-comment another to play with different background images. Be sure to change the photo cred when you do in `app/views/layouts/application.html.erb` because these photos are Creative Commons attribution liscensed, found on [flickr creative commons](http://www.flickr.com/creativecommons/). Feel free to find your own!

######Text

There are four main messages: two on the welcome page, and two on the 'thanks' page. All four of these messages are conveniently located in the file `config/locales/en.yml`. Simply open this file and start changing the text to be specific to your application.

You may run out of space for text inside the 'container' element. If that is the case, consider changing the height of that element on line 1 of `app/assets/stylesheets/welcome.css.sass`.

######Everything Else

Since you own this rails project after you clone it, you can do whatever you want with it. Feel free to build an application on top of this, as you already have authentication all set up.

###Deployment

This project is all set up to deploy to heroku's free tier. Open your terminal and run:

	heroku create my-apps-name
	git add . && git commit -m 'push to heroku'
	git push heroku master
	heroku run rake db:migrate
	
At this point, you should be able to open and share your app on heroku with the world!

###Conclusion

We'd love to hear any feedback from you about how we can make our product easier to use and more powerful. If you've run into any hiccups along the way, feel free to email <support@dailycred.com> for any help and we'd love to assist you.
	
