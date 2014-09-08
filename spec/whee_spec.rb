require 'spec_helper.rb'

describe 'Registration object' do

  before :all do
    @public_group_search = 'Flip Cup'
    @public_group_name = 'Toolbox Flip Cup Association'
    @public_group_description = 'A fixed group used in automated testing.'
    @private_group_search = 'Secret Santas'
    @password = 'asdfasdf'
    
    @sign_in_user = 'jnrcodes@gmail.com'
    @fixed_user = 'fixeduser@foo.com'
    @fixed_group_user = 'fixedgroup@foo.com'
  end
 

  describe 'Sign On', type: :feature do
    it 'can use the signup form' do       
      visit 'http://wheedu-staging.herokuapp.com/users/sign_in'    
      find('#signup_button_login').click            
      expect(page).to have_content("Welcome back to Wheedu")
      find('#sign_in_email').tap { |f| f.click; f.set 'jnrcodes@gmail.com' }
      find('#sign_in_password').tap { |f| f.click; f.set 'asdfasdf' }
      find('#sign_in_submit').click
sleep(3)                      
      
      #sleep(1)
      # Make sure we're on the sign in page
      expect(page).to have_content("awesome ways to help")
      expect(page).to have_xpath("//img[@src='/images/thumb_40_default_user_icon.jpg']")     
     
      find('#user_info_toggle').click
      #sleep(1)
      find(:xpath, '//a[@id="#sign_out"]').click 	
sleep(1)                      
      #sleep(6)
     
      # Make sure we're on the sign on page.
      expect(page).to have_content('WHAT TYPE OF GROUP ARE YOU')
      
    end
  end # End signon test
  

  
  describe 'Register No Group', type: :feature do
    it 'can use the signup form' do 
      visit 'http://wheedu-staging.herokuapp.com/users/sign_in'    
        
        # Click "Sign Up"
        find('#signup_button_sign_up').click     
sleep(1)                        
        expect(page).to have_content("Already have an account?")
      
        # Create the user we'll use
        registrant = User. new 
        puts registrant[:first_name]
        puts registrant[:gender_short]
      
        # Fill in the first form:        
        find('#registration_first_name').tap { |f| f.click; f.set registrant[:first_name] }
        find('#registration_last_name').tap { |f| f.click; f.set registrant[:surname] }        
        find('#registration_email').tap { |f| f.click; f.set registrant[:email] }
        find('#registration_password').tap { |f| f.click; f.set 'asdfasdf' }
        find('#registration_submit').click  
sleep(1)                        
        
        expect(page).to have_content("Complete Your Personal Profile")
        
        # Skip through the rest
        find(:xpath, './/div[contains(text(), "Skip") and @class="ng-binding"]').click 	
sleep(1)                
        expect(page).to have_content("Upload Your Profile Image")
        
        find(:xpath, './/div[contains(text(), "Skip") and @class="ng-binding"]').click 	
sleep(1)                
        expect(page).to have_content("Invite Your Friends To Wheedu")
        
        find(:xpath, './/div[contains(text(), "Skip") and @class="ng-binding"]').click 	
sleep(1)                
        expect(page).to have_content("Established Connections")
        #sleep (3)
        
        
        click_on 'Finish'
        #find(:xpath, './/button[contains(text(), "Finish") and @ng-click="registrationStep = 5;"]').click 	
        #sleep (5)
        
        
        # Can't skip the damn tour for some reason?
        #expect(page).to have_content("CONGRATS AND WELCOME")
        #find(:xpath, './/div[contains(text(), "Skip our tour")').click 	       
                
        #expect(page).to have_content("Are you sure you want to skip this tour?")
        #find(:xpath, './/button[contains(text(), "Skip The Tour")]').click 	
        
        #expect(page).to have_content("Ok, you're a person of action")
                
        
        find(:xpath, './/div[contains(text(), "Start") and @class="ng-binding"]').click 	
        #expect(page).to have_content("NAVIGATION")
        
        
        find(:xpath, './/div[contains(text(), "Next") and @class="ng-binding"]').click 	
        #expect(page).to have_content("YOUR DASHBOARD")
        
        
        find(:xpath, './/div[contains(text(), "Next") and @class="ng-binding"]').click 	
        #expect(page).to have_content("GROUP PAGES")
        
        
        find(:xpath, './/div[contains(text(), "Next") and @class="ng-binding"]').click 	        
        # Your calendar
        
        
        find(:xpath, './/div[contains(text(), "Next") and @class="ng-binding"]').click 	     
        # Your wheefeed        
        
        
        find(:xpath, './/div[contains(text(), "Next") and @class="ng-binding"]').click 	        
        # And so much more
        
        
        find(:xpath, './/div[contains(text(), "Next") and @class="ng-binding"]').click 	        
        #Congrats pretty
        

        # click "go to a group"
        find('#registration_goto_group_2').click         
        
puts '################################################'      
puts '################################################'
puts '################################################'
puts '################################################'
puts '################################################'
puts '################################################'
puts '################################################'
sleep(5)  

        expect(page).to have_content("Wheedu Central")
        	
          
        # click "wheedu central"
        find(:xpath, './/a[contains(text(), "Wheedu Central") and @class="ng-binding"]').click 	
sleep(2)                
        expect(page).to have_content("Wheedu Central")
        expect(page).to have_content("UPCOMING EVENTS")
        sleep (5)
     
    end
  end # End register and join no groups


  describe 'Register Public Group', type: :feature do
    it 'can use the signup form' do 
      visit 'http://wheedu-staging.herokuapp.com/users/sign_in'    
        
        # Click "Sign Up"
        find('#signup_button_sign_up').click     
        expect(page).to have_content("Already have an account?")
      
        # Create the user we'll use
        registrant = User. new 
        puts registrant[:first_name]
        puts registrant[:gender_short]
      
        # Fill in the first form:        
        find('#registration_first_name').tap { |f| f.click; f.set registrant[:first_name] }
        find('#registration_last_name').tap { |f| f.click; f.set registrant[:surname] }        
        find('#registration_email').tap { |f| f.click; f.set registrant[:email] }
        find('#registration_password').tap { |f| f.click; f.set 'asdfasdf' }
        find('#registration_submit').click  
sleep(1)                        
        expect(page).to have_content("Complete Your Personal Profile")
        
        # Skip through the rest
        find(:xpath, './/div[contains(text(), "Skip") and @class="ng-binding"]').click 	
sleep(1)                        
        expect(page).to have_content("Upload Your Profile Image")
        
        find(:xpath, './/div[contains(text(), "Skip") and @class="ng-binding"]').click 	
sleep(1)                
        expect(page).to have_content("Invite Your Friends To Wheedu")
        
        find(:xpath, './/div[contains(text(), "Skip") and @class="ng-binding"]').click 	
sleep(1)                
        expect(page).to have_content("Established Connections")
        #sleep (3)
        
        
        click_on 'Finish'
        #find(:xpath, './/button[contains(text(), "Finish") and @ng-click="registrationStep = 5;"]').click 	
        #sleep (5)
        
        
        # Can't skip the damn tour for some reason?
        #expect(page).to have_content("CONGRATS AND WELCOME")
        #find(:xpath, './/div[contains(text(), "Skip our tour")').click 	       
                
        #expect(page).to have_content("Are you sure you want to skip this tour?")
        #find(:xpath, './/button[contains(text(), "Skip The Tour")]').click 	
        
        #expect(page).to have_content("Ok, you're a person of action")
                
        
        find(:xpath, './/div[contains(text(), "Start") and @class="ng-binding"]').click 	
        #expect(page).to have_content("NAVIGATION")
        
        
        find(:xpath, './/div[contains(text(), "Next") and @class="ng-binding"]').click 	
        #expect(page).to have_content("YOUR DASHBOARD")
        
        
        find(:xpath, './/div[contains(text(), "Next") and @class="ng-binding"]').click 	
        #expect(page).to have_content("GROUP PAGES")
        
        
        find(:xpath, './/div[contains(text(), "Next") and @class="ng-binding"]').click 	        
        # Your calendar
        
        
        find(:xpath, './/div[contains(text(), "Next") and @class="ng-binding"]').click 	     
        # Your wheefeed        
        
        
        find(:xpath, './/div[contains(text(), "Next") and @class="ng-binding"]').click 	        
        # And so much more
        
        
        find(:xpath, './/div[contains(text(), "Next") and @class="ng-binding"]').click 	        
        #Congrats pretty
        

        # click "go to a group"
        find('#registration_goto_group_2').click         

puts '################################################'      
puts '################################################'
puts '################################################'
puts '################################################'
puts '################################################'
puts '################################################'
puts '################################################'
sleep(5)  
        expect(page).to have_content("Wheedu Central")
        	
        # click "wheedu central"
puts 'b'        
        find(:xpath, './/a[contains(text(), "Wheedu Central") and @class="ng-binding"]').click 	
sleep(5)        
        
        expect(page).to have_content("Wheedu Central")
        expect(page).to have_content("UPCOMING EVENTS")
sleep(1)                
        
        ####################################################################
        # Join the flip cup group
        ####################################################################
        # Fill in the search field
        find('#search').tap { |f| f.click; f.set @public_group_search }
        sleep (1)
        # Click "GO"
        find(:xpath, './/input[@name="commit" and @class="search-submit-btn"]').click
        sleep (1)        
        # Make sure the flip cup group is on the page
        expect(page).to have_content(@public_group_name)
        
        # Click the button to view the group
        find(:xpath, './/a[contains(text(), "View Group") and @role="button"]').click 	
sleep(1)                
        expect(page).to have_content(@public_group_description)
        
        # Click the button to join the group
        find(:xpath, './/a[contains(text(), "Join Group")]').click 	
        #expect(page).to have_content("You are a participant")
        
        
        # Click the button to visit the group
        #find(:xpath, '(.//a[contains(text(), "Visit Group.")])[1]').click 	
        find(:xpath, './/h3[contains(text(), "Toolbox Flip Cup Association")]').click
sleep(1)                
        expect(page).to have_content("Jessica Dougherty")
        
        sleep (3)
        
        # Log out!
        find('#user_info_toggle').click
        #sleep(1)
        find(:xpath, '//a[@id="#sign_out"]').click 	
      
        #sleep(6)
     
        # Make sure we're on the sign on page.
sleep(1)                
        expect(page).to have_content('WHAT TYPE OF GROUP ARE YOU')
        
        ####################################################################
        # Now, log in our fixed user and check that they show as a new member
        ####################################################################
        find('#signup_button_login').click            
sleep(1)                
        expect(page).to have_content("Welcome back to Wheedu")
        find('#sign_in_email').tap { |f| f.click; f.set @fixed_group_user }
        find('#sign_in_password').tap { |f| f.click; f.set @password }
        find('#sign_in_submit').click
sleep(3)                        
        expect(page).to have_content(registrant[:first_name] + ' ' + registrant[:surname])
        
        sleep (10)        
    end
  end # End register and join a groups

  describe 'Register Private Group', type: :feature do
    it 'can use the signup form and join a private group' do 
      visit 'http://wheedu-staging.herokuapp.com/users/sign_in'    
      # Register
      # Search on secret santas
      # Request to join secret santas 
      # Sign out
      # Sign in as fixed_group_user with password asdfasdf
      # Approve membership
      # Sign out
      # Sign in as original user
      # Check for approval in the in the notification
      
    end
  end

  
end # End registration tests