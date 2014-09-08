require 'spec_helper.rb'

describe 'Registration object' do
  before :all do
    @boy_names = %w[ Andrew Anthony Benjamin Brian Carl Charles 
      Christopher Daniel David Donald Douglas Edward Eric  Gary 
      George Gregory Henry Jack James Jason Jeffrey Jerry Joe 
      John Jonathan Jose Joseph Joshua Juan Justin Keith Kenneth Kevin 
      Lawrence Mark Matthew Michael Nicholas Patrick Paul Peter Raymond 
      Richard Robert  Roy Ryan Samuel Scott Stephen Steven Terry 
	  Brandon Tyler Jacob Zachery Kyle Alexander Cody Dylan Jordan
	  Christian Austin Ethan Logan Noah Gabriel Elijah Mason 
      Thomas Timothy William  ]
						  
    @girl_names = %w[ Alicia Allison Amber Ana April Audrey Beth                   
      Brittany Carrie Cathy Charlene Charlotte Clara  Claudia 
      Dana Danielle Dawn Ella Ellen Emma  Erica Erin Eva  Georgia 
      Grace Holly Jackie Jamie Jessie Joy Katie Kim 
      Kristin Lauren Laurie Leslie Lillie Liz Megan Melanie Michele 
      Monica Natalie Renee Rosemary Shannon Sheila Sherry 
      Stacey Sue Suzanne Tamara Tara Terri Tiffany Tracy Valerie Vanessa 
	  Jessica Ashley Sara Sarah Emily Taylor Stephanie Nicole Rachel
	  Kayla Courtney Hannah Rebecca Jasmine Kelsey Alyssa Morgan
	  Alexis Christina 
      Veronica Victoria Vivian ]

    @surnames = %w[Adams Alexander Allen Alvarez Anderson Andrews Armstrong 
      Arnold Austin Bailey Baker Banks Barnes Bell Bennett Berry Bishop 
      Black Bowman Boyd Bradley Brewer Brooks Brown Bryant Burke Burns 
      Burton Butler Byrd Campbell Carlson Carpenter Carr Carroll Carter 
      Castillo Chapman Chavez Clark Cole Coleman Collins Cook Cooper Cox 
      Crawford Cruz Cunningham Daniels Davidson Davis Day Dean Diaz Dixon 
      Douglas Duncan Dunn Edwards Elliott Ellis Evans Ferguson Fernandez 
      Fields Fisher Fleming Flores Ford Foster Fowler Fox Franklin Frazier 
      Freeman Fuller Garcia Gardner Garrett Garza George Gibson Gilbert 
      Gomez Gonzales Gonzalez Gordon Graham Grant Gray Green Greene Griffin 
      Gutierrez Hall Hamilton Hansen Hanson Harper Harris Harrison Hart 
      Harvey Hawkins Hayes Henderson Henry Hernandez Herrera Hicks Hill 
      Hoffman Holland Holmes Hopkins Howard Howell Hudson Hughes Hunt Hunter 
      Jackson Jacobs James Jenkins Jensen Johnson Johnston Jones Jordan 
      Kelley Kelly Kennedy Kim King Knight Lane Larson Lawrence Lawson 
      Lee Lewis Little Long Lopez Lynch Marshall Martin Martinez Mason 
      Matthews May Mccoy Mcdonald Medina Mendoza Meyer Miller Mills Mitchell 
      Montgomery Moore Morales Moreno Morgan Morris Morrison Murphy Murray 
      Myers Nelson Nguyen Nichols Oliver Olson Ortiz Owens Palmer Parker 
      Patterson Payne Pearson Perez Perkins Perry Peters Peterson Phillips 
      Pierce Porter Powell Price Ramirez Ramos Ray Reed Reid Reyes 
      Reynolds Rice Richards Richardson Riley Rivera Roberts Robertson 
      Rodriguez Rogers Romero Rose Ross Ruiz Russell Ryan Sanchez Sanders 
      Schmidt Scott Shaw Silva Simmons Simpson Sims Smith Snyder Soto Spencer 
      Stanley Stephens Stevens Stewart Stone Sullivan Taylor Terry Thomas 
      Thompson Torres Tucker Turner Vargas Vasquez Wade Wagner Walker 
      Wallace WaltersWard Warren Washington Watkins Watson Weaver Webb 
      Welch Wells West Wheeler White Williams Williamson Willis Wilson 
      Wood Woods Wright Young     ]
  end

=begin
  describe 'Sign in', type: :feature do
    it 'signs in as a registered user' do 
      visit 'http://wishes:wishes@www.mybirthdayfor.com/make-a-wish'	
      expect(page).to have_selector(:link_or_button, 'Sign In')      
      click_on 'Sign In'     
      expect(page).to have_content('Forgot your password?')
      fill_in 'user_email', with: 'jnrcodes@gmail.com'
      fill_in 'user_password', with: 'asdfasdf'
      click_on 'Sign in'
      expect(page).to have_content("JODY TB9")
      click_on 'Sign Out'
      expect(page).to have_content("START YOUR BIRTHDAY WISHES")
    end
  end

  

  describe 'Register from the top', type: :feature do
    it 'registers using top of the screen button' do 
      visit 'http://wishes:wishes@www.mybirthdayfor.com/make-a-wish'	
      expect(page).to have_selector(:link_or_button, "Let's Go!")
      click_on "Let's Go!"
      expect(page).to have_content('1 of 2')
      expect(page).to have_content('When were you born')
      # use the current date	
      click_on 'Next'		
      fill_in 'user_first_name', with: @boy_names.sample
      fill_in 'user_last_name', with: @surnames.sample
      select "Male", :from => "user_gender"
      fill_in 'user_zip', with: Random.rand(30000...39999).to_s
      fill_in 'user_email', with: 'tb9' + Random.rand(000010...999999).to_s + '@foo.com'
      fill_in 'user_password', with: 'asdfasdf'	
      expect(page).to have_content("2 of 2")
      click_on 'Finish'
      expect(page).to have_content("YOU HAVE THREE STEPS TO ACTIVATE YOUR CAMPAIGN")
    end
  end

  

  describe 'Register from the bottom', type: :feature do
    it 'registers with the button on the bottom of the screen' do 
      visit 'http://wishes:wishes@www.mybirthdayfor.com/make-a-wish'	
      expect(page).to have_selector(:link_or_button, 'Start your birthday wishes campaign in 3 minutes')
      click_on "Let's Go!"
      expect(page).to have_content('1 of 2')
      expect(page).to have_content('When were you born')
      # use the current date	
      click_on 'Next'
      fill_in 'user_first_name', with: @boy_names.sample
      fill_in 'user_last_name', with: @surnames.sample
      select 'Male', from: 'user_gender'
      fill_in 'user_zip', with: Random.rand(30000...39999).to_s
      fill_in 'user_email', with: 'tb9' + Random.rand(000010...999999).to_s + '@foo.com'
      fill_in 'user_password', with: 'asdfasdf'	
      expect(page).to have_content('2 of 2')
      click_on 'Finish'
      expect(page).to have_content('YOU HAVE THREE STEPS TO ACTIVATE YOUR CAMPAIGN')	
    end
  end
=end
  
  describe 'Register and invite a friend', type: :feature do
    it 'registers and invites a friend to the campaign' do 
      visit 'http://wishes:wishes@www.mybirthdayfor.com/make-a-wish'	
puts 'AAA'      
have_clicky 'omg it worked'      
puts 'BBB'      
      expect(page).to have_selector(:link_or_button, 'Start your birthday wishes campaign in 3 minutes')
      click_on "Let's Go!"
      expect(page).to have_content('1 of 2')
      expect(page).to have_content('When were you born')
      # use the current date	
      click_on 'Next'
      fill_in 'user_first_name', with: @boy_names.sample
      fill_in 'user_last_name', with: @surnames.sample
      select 'Male', from: 'user_gender'
      fill_in 'user_zip', with: Random.rand(30000...39999).to_s
      fill_in 'user_email', with: 'tb9' + Random.rand(000010...999999).to_s + '@foo.com'
      fill_in 'user_password', with: 'asdfasdf'	
      expect(page).to have_content('2 of 2')
      click_on 'Finish'

      # This Finish step takes a long time, so look for the text first in a spin lock.
      find_any_text("Make your")
      
      expect(page).to have_content('YOU HAVE THREE STEPS TO ACTIVATE YOUR CAMPAIGN')	
      expect(page).to have_content("You haven't added anyone to your campaign")	
      click_on 'Click here to add some emails.'
sleep (2)      
      fill_in 'Add an email', with: "tb9junkdump@gmail.com\n"	  
sleep (2)
	  expect(page).to have_content('tb9junkdump@gmail.com')	
sleep (2)
	  find(:xpath, './/button[contains(text(), "Add to Invitation List")]').click 	  
sleep (2)          
	  click_on 'Return to Dashboard'	  
	  expect(page).to have_content('tb9junkdump@gmail.com')	      
    end
  end
  
  

end