# Launchy by [Dailycred](https://www.dailycred.com)

##### Launchy is the quickest way to get a landing page up and running that is functional and fully customizeable with a robust authentication system.

To get started, first [sign up for dailycred](https://www.dailycred.com). Make sure you've also created a [facebook application](https://developers.facebook.com/apps) and a (twitter application)[https://dev.twitter.com/apps] so that you can integrate twitter and facebook connect into your application. Once you have your API keys ready, head over to your [settings page](https://www.dailycred.com/admin/setup) and add them to your account. Once that's all set up, open your terminal and run:

	git clone git/link/here
	
Open up the newly downloaded 'launchy' folder in your favorite text editor, and open up the file `config/initializers/omniauth.rb`. Change the first two lines to use your dailycred API keys, located on your [account page](https://www.dailycred.com/admin/settings). The first two lines should look something like this:

	Rails.configuration.DAILYCRED_CLIENT_ID = "YOUR-REAL-CLIENT-ID"
	Rails.configuration.DAILYCRED_SECRET_KEY = "YOUR-REAL-CLIENT-SECRET"
	
Finally, run `rails s` and open your browser to <http://localhost:3000>.

You're all set! You have a fully running landing page where users can create real accounts and sign up with facebook and twitter. This has an advantage over other email-only options in that you can get a better idea of who your users are. Also, if you decide to build out a real application, you can keep all the same users who have already signed up for you.

###Customization

######Background Url

There are three preset options for the background image. open `app/assets/welcome.css.sass`
	
