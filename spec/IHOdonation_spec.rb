require 'spec_helper.rb'

describe 'Donate object' do
 
  describe 'donate with good card', type: :feature do
    it 'checks donation link' do 
      
	  url = 'http://mandrillapp.com/track/click.php?u=30249543&id=a32b941e93424961a2aa545a10c2d680&url=http%3A%2F%2Fwww.mybirthdayfor.com%2Fu%2Fnick-cooper%3Ftoken%3Dfb11d854c507be8a3309e045442694d56b2fc83a52d7c8adcde0725a231d2ddf&url_id=ba6c2942c83355f6fcaa673f937070a436eddb5b'	     


      RestClient.get(url) do |resp, req, res|
	    if resp.code > 300 && resp.code < 400 then
		  url = resp.headers[:location]
		end
	  end
	  url.sub!(%r{http://}) { |s| "#{s}wishes:wishes@" }
      puts "now url = #{url}"
	  visit url

      
	  
	  #page.driver.browser.authorize 'wishes', 'wishes'
	  
	  expect(page).to have_selector(:link_or_button, "Donate Now to Nick's Campaign")
	  click_on "Donate Now to Nick's Campaign"
	  fill_in 'Amount', with: '.01'
	  fill_in 'CardNumber', with: '379016486787384'
	  fill_in 'CVV', with: '7331'
	  fill_in 'CardHolderName', with: 'Jason Rhoades'
	  fill_in 'Address1', with: '659 Auburn Ave'	
	  fill_in 'Address2', with: 'Unit 254'		
      select '03', :from => 'ExpMonth'
	  select '2023', :from => 'ExpYear'
	  sleep(1)
	  fill_in 'City', with: 'Atlanta'
	  fill_in 'State', with: 'GA'
	  fill_in 'Zip', with: '30312'
	  fill_in 'Message', with: 'Happy Birthday!'
	  #page.evaluate_script('window.confirm = function() { return true; }')
      find(:xpath, './/button[contains(text(), "Submit")]').click 	
	  sleep(1)
	  
	  
#      begin
#	    a = page.driver.browser.switch_to.alert
#        a.accept  # can also be a.dismiss		
#	  rescue => e
	      
#	  end

	  sleep(3)
	  expect(page).to have_content('THANK YOU')	 
	  expect(page).to have_content('Your donation of')	 
	  #find(:xpath, '//button[contains(text(), "Nick")]').click 
	  #click_on "Donate"
	  #click_link "Back to Nick's Donation Page"	    	  
	  sleep(1)
	  click_link "Back to Nick's Campaign Page"	    	  
	  sleep(3)
	  expect(page).to have_content('BIRTHDAY WISHES')	 
	  
    end
  end


  describe 'donate with good card - pop up', type: :feature do
    it 'checks donation link' do 
      
	  url = 'http://mandrillapp.com/track/click.php?u=30249543&id=a32b941e93424961a2aa545a10c2d680&url=http%3A%2F%2Fwww.mybirthdayfor.com%2Fu%2Fnick-cooper%3Ftoken%3Dfb11d854c507be8a3309e045442694d56b2fc83a52d7c8adcde0725a231d2ddf&url_id=ba6c2942c83355f6fcaa673f937070a436eddb5b'	     


      RestClient.get(url) do |resp, req, res|
	    if resp.code > 300 && resp.code < 400 then
		  url = resp.headers[:location]
		end
	  end
	  url.sub!(%r{http://}) { |s| "#{s}wishes:wishes@" }
      puts "now url = #{url}"
	  visit url

      
	  
	  #page.driver.browser.authorize 'wishes', 'wishes'
	  
	  expect(page).to have_selector(:link_or_button, "Donate Now to Nick's Campaign")
	  click_on "Donate Now to Nick's Campaign"
	  fill_in 'Amount', with: '.01'
	  fill_in 'CardNumber', with: '379016486787384'
	  fill_in 'CVV', with: '7331'
	  fill_in 'CardHolderName', with: 'Jason Rhoades'
	  fill_in 'Address1', with: '659 Auburn Ave'	
	  fill_in 'Address2', with: 'Unit 254'		
      select '03', :from => 'ExpMonth'
	  select '2023', :from => 'ExpYear'
	  sleep(1)
	  fill_in 'City', with: 'Atlanta'
	  fill_in 'State', with: 'GA'
	  fill_in 'Zip', with: '30312'
	  fill_in 'Message', with: 'Happy Birthday!'
	  #page.evaluate_script('window.confirm = function() { return true; }')
      find(:xpath, './/button[contains(text(), "Submit")]').click 	
	  sleep(1)	  	 
      a = page.driver.browser.switch_to.alert
      a.accept  # can also be a.dismiss		
	  sleep(3)
	  expect(page).to have_content('THANK YOU')	 
	  expect(page).to have_content('Your donation of')	 
	  #find(:xpath, '//button[contains(text(), "Nick")]').click 
	  #click_on "Donate"
	  #click_link "Back to Nick's Donation Page"	    	  
	  sleep(1)
	  click_link "Back to Nick's Campaign Page"	    	  
	  sleep(3)
	  expect(page).to have_content('BIRTHDAY WISHES')	 
	  
    end
  end
end