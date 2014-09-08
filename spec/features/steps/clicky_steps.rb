module ClickySteps

  rspec :type => :feature
  
  def have_clicky(text)
    
    puts text + ' I FOUNDED IT!!'

  end
  
  def find_any_text(text)
    page.document.synchronize do
      find(:xpath, './/*[contains(text(), "' + text + '")]')
    end
  
  end

  
end
