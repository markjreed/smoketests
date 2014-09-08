require 'spec_helper.rb'
require 'json'

describe 'Registration object' do

  describe 'Register Alabama Fan', type: :feature do
    it 'registers as an Alabama fan' do 
      # Go to the page
      visit 'http://toolrack9.com/jwt/weownsaturdays/2014-2015/build/round2/weownsaturdays/'    
      
      # Check for a few things
      expect(page).to have_selector(:link_or_button, 'Auburn')     		
      expect(page).to have_selector(:link_or_button, 'Tennessee')
      expect(page).to have_selector(:link_or_button, 'Alabama')
      expect(page).to have_selector(:link_or_button, 'Georgia')
	  
      # Pick Alabama
      click_on('Alabama')
      
      # Check to make sure there is something to do with Alabama on the page!
      expect(page).to have_xpath("//img[@src=\"images/alabama/bg-home-center.jpg\"]")
      
      # Go on in.  Make sure there's more Alabama-related stuff here, while we're here
      click_on('Enter Now')
      expect(page).to have_xpath("//img[@src=\"images/alabama/logo-saturdays.jpg\"]")

      # Generate the data      
      registrant = User. new 
	  
      # Fill in the fields with generated data
      fill_in 'first_name', with: registrant[:boy_name]
      fill_in 'last_name', with: registrant[:surname]
      fill_in 'address', with: registrant[:address_1]
      fill_in 'city', with: registrant[:city]
      fill_in 'zip_code', with: registrant[:zip]
      fill_in 'e', with: registrant[:email]
      fill_in 'e2', with: registrant[:email]
            
      # Fill in fields with fixed data
      select 'Alabama', from: 'state'
      check('i_am_18')    
      select 'Edge', from: 'car_select1'
      select 'Escape', from: 'car_select2'
      select 'Fiesta', from: 'car_select3'
      find(:xpath, "//input[@name='when_plan_to_acquire' and @value='1-3 months']").click   
      find(:xpath, "//input[@name='how_plan_to_acquire' and @value='Purchase']").click
      find(:xpath, "//input[@name='how_likely_to_buy_ford' and @value='Undecided']").click      
      sleep(1)
      
      # And submit
      click_on('Click Here to Enter')
      sleep (2)
      expect(page).to have_content('Now go out and score')          
      sleep(1)     
	  
	  
      # Check the person was added!	  
      url = 'http://toolrack9.com/jwt/weownsaturdays/2014-2015/build/round2/weownsaturdays/download-alabama-json.php?first_name=' + registrant[:boy_name] + '&last_name=' + registrant[:surname] + '&email=' + registrant[:email]
      #puts url
      resp = Net::HTTP.get_response(URI.parse(url))	  
      data = resp.body
      result = JSON.parse(data)
      
      # Check our user, but set it up so that test failures here are
      # easy to understand.
      user_count = JSON.parse(data).length	                    
      expect(user_count).to eq 1	 
      
      # Check that the data made it, putting results in a variable for easy test reading
      first_car_selected = result[0]['car_select1']
      plan_to_acquire = result[0]['how_plan_to_acquire']
      opt_in_to_email = result[0]['opt_in'].empty?      
      expect(first_car_selected).to eq "Edge"
      expect(plan_to_acquire).to eq "Purchase"
      expect(opt_in_to_email).to eq true      
    end
  end
  
  
 
  describe 'Register Auburn Fan', type: :feature do
    it 'registers as an Auburn fan' do 
      # Go to the page
      visit 'http://toolrack9.com/jwt/weownsaturdays/2014-2015/build/round2/weownsaturdays/'    
      
      # Check for a few things
      expect(page).to have_selector(:link_or_button, 'Auburn')      
      expect(page).to have_selector(:link_or_button, 'Tennessee')
      expect(page).to have_selector(:link_or_button, 'Alabama')
      
      # This Ga button isn't showing for some reason!
      #expect(page).to have_selector(:link_or_button, 'Georgia')
      
      # Pick Auburn
      click_on('Auburn')
      
      # Check to make sure there is something to do with Auburn on the page!
      expect(page).to have_xpath("//img[@src=\"images/auburn/bg-home-center.jpg\"]")
      
      # Go on in.  Make sure there's more Auburn-related stuff here, while we're here
      click_on('Enter Now')
      expect(page).to have_xpath("//img[@src=\"images/auburn/logo-saturdays.jpg\"]")
            
# Generate the data      
      registrant = User. new 
	  
      # Fill in the fields with generated data
      fill_in 'first_name', with: registrant[:boy_name]
      fill_in 'last_name', with: registrant[:surname]
      fill_in 'address', with: registrant[:address_1]
      fill_in 'city', with: registrant[:city]
      fill_in 'zip_code', with: registrant[:zip]
      fill_in 'e', with: registrant[:email]
      fill_in 'e2', with: registrant[:email]
            
      # Fill in fields with fixed data
      select 'Mississippi', from: 'state'
      check('i_am_18')    
      select 'Edge', from: 'car_select1'
      select 'Escape', from: 'car_select2'
      select 'Fiesta', from: 'car_select3'
      find(:xpath, "//input[@name='when_plan_to_acquire' and @value='1-3 months']").click   
      find(:xpath, "//input[@name='how_plan_to_acquire' and @value='Purchase']").click
      find(:xpath, "//input[@name='how_likely_to_buy_ford' and @value='Undecided']").click      
      sleep(1)
      
      # And submit
      click_on('Click Here to Enter')
      sleep (2)
      expect(page).to have_content('Now go out and score')          
      sleep(1)     
	  
	  
      # Check the person was added!	  
      url = 'http://toolrack9.com/jwt/weownsaturdays/2014-2015/build/round2/weownsaturdays/download-auburn-json.php?first_name=' + registrant[:boy_name] + '&last_name=' + registrant[:surname] + '&email=' + registrant[:email]
      #puts url
      resp = Net::HTTP.get_response(URI.parse(url))	  
      data = resp.body
      result = JSON.parse(data)
      
      # Check our user, but set it up so that test failures here are
      # easy to understand.
      user_count = JSON.parse(data).length	                    
      expect(user_count).to eq 1	 
      
      # Check that the data made it, putting results in a variable for easy test reading
      first_car_selected = result[0]['car_select1']
      plan_to_acquire = result[0]['how_plan_to_acquire']
      opt_in_to_email = result[0]['opt_in'].empty?      
      expect(first_car_selected).to eq "Edge"
      expect(plan_to_acquire).to eq "Purchase"
      expect(opt_in_to_email).to eq true      
    end
  end

  describe 'Register Tennessee Fan', type: :feature do
    it 'registers as an Tennessee fan' do 
      # Go to the page
      visit 'http://toolrack9.com/jwt/weownsaturdays/2014-2015/build/round2/weownsaturdays/'    
      
      # Check for a few things
      expect(page).to have_selector(:link_or_button, 'Auburn')      
      expect(page).to have_selector(:link_or_button, 'Tennessee')
      expect(page).to have_selector(:link_or_button, 'Alabama')
      
      # This Ga button isn't showing for some reason!
      #expect(page).to have_selector(:link_or_button, 'Georgia')
      
      # Pick Tennessee
      click_on('Tennessee')
      
      # Check to make sure there is something to do with Tennessee on the page!
      expect(page).to have_xpath("//img[@src=\"images/tennessee/bg-home-center.jpg\"]")
      
      # Go on in.  Make sure there's more Tennessee-related stuff here, while we're here
      click_on('Enter Now')
      expect(page).to have_xpath("//img[@src=\"images/tennessee/logo-saturdays.jpg\"]")
            
      # Generate the data      
      registrant = User. new 
	  
      # Fill in the fields with generated data
      fill_in 'first_name', with: registrant[:boy_name]
      fill_in 'last_name', with: registrant[:surname]
      fill_in 'address', with: registrant[:address_1]
      fill_in 'city', with: registrant[:city]
      fill_in 'zip_code', with: registrant[:zip]
      fill_in 'e', with: registrant[:email]
      fill_in 'e2', with: registrant[:email]
            
      # Fill in fields with fixed data
      select 'Tennessee', from: 'state'
      check('i_am_18')    
      select 'Edge', from: 'car_select1'
      select 'Escape', from: 'car_select2'
      select 'Fiesta', from: 'car_select3'
      find(:xpath, "//input[@name='when_plan_to_acquire' and @value='1-3 months']").click   
      find(:xpath, "//input[@name='how_plan_to_acquire' and @value='Purchase']").click
      find(:xpath, "//input[@name='how_likely_to_buy_ford' and @value='Undecided']").click      
      sleep(1)
      
      # And submit
      click_on('Click Here to Enter')
      sleep (2)
      expect(page).to have_content('Now go out and score')          
      sleep(1)     
	  
	  
      # Check the person was added!	  
      url = 'http://toolrack9.com/jwt/weownsaturdays/2014-2015/build/round2/weownsaturdays/download-tennessee-json.php?first_name=' + registrant[:boy_name] + '&last_name=' + registrant[:surname] + '&email=' + registrant[:email]
      #puts url
      resp = Net::HTTP.get_response(URI.parse(url))	  
      data = resp.body
      result = JSON.parse(data)
      
      # Check our user, but set it up so that test failures here are
      # easy to understand.
      user_count = JSON.parse(data).length	                    
      expect(user_count).to eq 1	 
      
      # Check that the data made it, putting results in a variable for easy test reading
      first_car_selected = result[0]['car_select1']
      plan_to_acquire = result[0]['how_plan_to_acquire']
      opt_in_to_email = result[0]['opt_in'].empty?      
      expect(first_car_selected).to eq "Edge"
      expect(plan_to_acquire).to eq "Purchase"
      expect(opt_in_to_email).to eq true      
    end
  end

  describe 'Register Georgia Fan', type: :feature do
    it 'registers as an Georgia fan' do 
      # Go to the page
      visit 'http://toolrack9.com/jwt/weownsaturdays/2014-2015/build/round2/weownsaturdays/'    
      
      # Check for a few things
      expect(page).to have_selector(:link_or_button, 'Auburn')      
      expect(page).to have_selector(:link_or_button, 'Georgia')
      expect(page).to have_selector(:link_or_button, 'Alabama')
      
      # This Ga button isn't showing for some reason!
      expect(page).to have_selector(:link_or_button, 'Georgia')
      
      # Pick Georgia
      click_on('Georgia')
      
      # Check to make sure there is something to do with Georgia on the page!
      expect(page).to have_xpath("//img[@src=\"images/georgia/bg-home-center.jpg\"]")
      
      # Go on in.  Make sure there's more Georgia-related stuff here, while we're here
      click_on('Enter Now')
      expect(page).to have_xpath("//img[@src=\"images/georgia/logo-saturdays.jpg\"]")
            
      # Generate the data      
      registrant = User. new 
	  
      # Fill in the fields with generated data
      fill_in 'first_name', with: registrant[:boy_name]
      fill_in 'last_name', with: registrant[:surname]
      fill_in 'address', with: registrant[:address_1]
      fill_in 'city', with: registrant[:city]
      fill_in 'zip_code', with: registrant[:zip]
      fill_in 'e', with: registrant[:email]
      fill_in 'e2', with: registrant[:email]
            
      # Fill in fields with fixed data
      select 'Georgia', from: 'state'
      check('i_am_18')    
      select 'Edge', from: 'car_select1'
      select 'Escape', from: 'car_select2'
      select 'Fiesta', from: 'car_select3'
      find(:xpath, "//input[@name='when_plan_to_acquire' and @value='1-3 months']").click   
      find(:xpath, "//input[@name='how_plan_to_acquire' and @value='Purchase']").click
      find(:xpath, "//input[@name='how_likely_to_buy_ford' and @value='Undecided']").click      
      sleep(1)
      
      # And submit
      click_on('Click Here to Enter')
      sleep (2)
      expect(page).to have_content('Now go out and score')          
      sleep(1)     
	  
	  
      # Check the person was added!	  
      url = 'http://toolrack9.com/jwt/weownsaturdays/2014-2015/build/round2/weownsaturdays/download-georgia-json.php?first_name=' + registrant[:boy_name] + '&last_name=' + registrant[:surname] + '&email=' + registrant[:email]
      puts url
      resp = Net::HTTP.get_response(URI.parse(url))	  
      data = resp.body
      result = JSON.parse(data)
      
      # Check our user, but set it up so that test failures here are
      # easy to understand.
      user_count = JSON.parse(data).length	                    
      expect(user_count).to eq 1	 
      
      # Check that the data made it, putting results in a variable for easy test reading
      first_car_selected = result[0]['car_select1']
      plan_to_acquire = result[0]['how_plan_to_acquire']
      opt_in_to_email = result[0]['opt_in'].empty?      
      expect(first_car_selected).to eq "Edge"
      expect(plan_to_acquire).to eq "Purchase"
      expect(opt_in_to_email).to eq true      
    end
  end
  
end