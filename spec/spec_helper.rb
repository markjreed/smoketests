require 'capybara/rspec'
require 'rest_client'

Capybara.default_driver = :selenium

Module.class_eval do
  ##
  #
  # Allows you to include a module to be available in your
  # rspec tests from without the module it self.
  #
  # @param [Hash] rspec options     A hash of options which instructs rspec on how (and where) to include the module.
  #
  # Example:
  # module MyMatchers
  #   rspec :type => :request
  #
  #   matcher :have_image do |alt|
  #     ...
  #   end
  # end
  #

  def rspec(options={})
    RSpec.configure do |config|
      config.include self, options
    end
  end
end

# Include all the modules we might have defined.
$: << Dir.pwd
Dir["spec/features/steps/**/*.rb"].each {|f| require f}





class User
  #############################################################################
  # Class representing a (randomly-generated) user
  #############################################################################
  Genders = { 'M' => 'Male', 'F' => 'Female' }

  States  = {'AK' => 'Alaska',
             'AL' => 'Alabama',
             'AR' => 'Arkansas',
             'AZ' => 'Arizona',
             'CA' => 'California',
             'CO' => 'Colorado',
             'CT' => 'Connecticut',
             'DC' => 'District of Columbia',
             'DE' => 'Delaware',
             'FL' => 'Florida',
             'GA' => 'Georgia',
             'GU' => 'Guam',
             'HI' => 'Hawaii',
             'IA' => 'Iowa',
             'ID' => 'Idaho',
             'IL' => 'Illinois',
             'IN' => 'Indiana',
             'KS' => 'Kansas',
             'KY' => 'Kentucky',
             'LA' => 'Louisiana',
             'MA' => 'Massachusetts',
             'MD' => 'Maryland',
             'ME' => 'Maine',
             'MI' => 'Michigan',
             'MN' => 'Minnesota',
             'MO' => 'Missouri',
             'MS' => 'Mississippi',
             'MT' => 'Montana',
             'NC' => 'North Carolina',
             'ND' => 'North Dakota',
             'NE' => 'Nebraska',
             'NH' => 'New Hampshire',
             'NJ' => 'New Jersey',
             'NM' => 'New Mexico',
             'NV' => 'Nevada',
             'NY' => 'New York',
             'OH' => 'Ohio',
             'OK' => 'Oklahoma',
             'OR' => 'Oregon',
             'PA' => 'Pennsylvania',
             'RI' => 'Rhode Island',
             'SC' => 'South Carolina',
             'SD' => 'South Dakota',
             'TN' => 'Tennessee',
             'TX' => 'Texas',
             'UT' => 'Utah',
             'VA' => 'Virginia',
             'VI' => 'Virgin Islands',
             'VT' => 'Vermont',
             'WA' => 'Washington',
             'WI' => 'Wisconsin',
             'WV' => 'West Virginia',
             'WY' => 'Wyoming' }
      
  # These attributes are initialized by sampling the corresponding array
  SimpleAttributes = {
    city:  %w[ Greenville Franklin Bristol Clinton Springfield
               Fairview Salem Washington Madison Georgetown Ashland
               Oxford Arlington Jackson Burlington Manchester
               Milton Centerville Clayton Dayton Lexington Milford
               Winchester Auburn ],

    gender_short: Genders.keys,

    state_short: States.keys,
     
    surname:   %w[Adams Alexander Allen Alvarez Anderson Andrews Armstrong
                  Arnold Austin Bailey Baker Banks Barnes Bell Bennett Berry
                  Bishop Black Bowman Boyd Bradley Brewer Brooks Brown Bryant
                  Burke Burns Burton Butler Byrd Campbell Carlson Carpenter
                  Carr Carroll Carter Castillo Chapman Chavez Clark Cole
                  Coleman Collins Cook Cooper Cox Crawford Cruz Cunningham
                  Daniels Davidson Davis Day Dean Diaz Dixon Douglas Duncan
                  Dunn Edwards Elliott Ellis Evans Ferguson Fernandez Fields
                  Fisher Fleming Flores Ford Foster Fowler Fox Franklin Frazier
                  Freeman Fuller Garcia Gardner Garrett Garza George Gibson
                  Gilbert Gomez Gonzales Gonzalez Gordon Graham Grant Gray
                  Green Greene Griffin Gutierrez Hall Hamilton Hansen Hanson
                  Harper Harris Harrison Hart Harvey Hawkins Hayes Henderson
                  Henry Hernandez Herrera Hicks Hill Hoffman Holland Holmes
                  Hopkins Howard Howell Hudson Hughes Hunt Hunter Jackson
                  Jacobs James Jenkins Jensen Johnson Johnston Jones Jordan
                  Kelley Kelly Kennedy Kim King Knight Lane Larson Lawrence
                  Lawson Lee Lewis Little Long Lopez Lynch Marshall Martin
                  Martinez Mason Matthews May Mccoy Mcdonald Medina Mendoza
                  Meyer Miller Mills Mitchell Montgomery Moore Morales Moreno
                  Morgan Morris Morrison Murphy Murray Myers Nelson Nguyen
                  Nichols Oliver Olson Ortiz Owens Palmer Parker Patterson
                  Payne Pearson Perez Perkins Perry Peters Peterson Phillips
                  Pierce Porter Powell Price Ramirez Ramos Ray Reed Reid Reyes
                  Reynolds Rice Richards Richardson Riley Rivera Roberts
                  Robertson Rodriguez Rogers Romero Rose Ross Ruiz Russell Ryan
                  Sanchez Sanders Schmidt Scott Shaw Silva Simmons Simpson Sims
                  Smith Snyder Soto Spencer Stanley Stephens Stevens Stewart
                  Stone Sullivan Taylor Terry Thomas Thompson Torres Tucker
                  Turner Vargas Vasquez Wade Wagner Walker Wallace WaltersWard
                  Warren Washington Watkins Watson Weaver Webb Welch Wells West
                  Wheeler White Williams Williamson Willis Wilson Wood Woods
                  Wright Young],

    boy_name: %w[ Andrew Anthony Benjamin Brian Carl Charles Christopher Daniel
                  David Donald Douglas Edward Eric  Gary George Gregory Henry
                  Jack James Jason Jeffrey Jerry Joe John Jonathan Jose Joseph
                  Joshua Juan Justin Keith Kenneth Kevin Lawrence Mark Matthew
                  Michael Nicholas Patrick Paul Peter Raymond Richard Robert
                  Roy Ryan Samuel Scott Stephen Steven Terry Brandon Tyler
                  Jacob Zachery Kyle Alexander Cody Dylan Jordan Christian
                  Austin Ethan Logan Noah Gabriel Elijah Mason Thomas Timothy
                  William  ],
                          
    girl_name: %w[ Alicia Allison Amber Ana April Audrey Beth
                   Brittany Carrie Cathy Charlene Charlotte Clara  Claudia Dana
                   Danielle Dawn Ella Ellen Emma  Erica Erin Eva  Georgia Grace
                   Holly Jackie Jamie Jessie Joy Katie Kim Kristin Lauren
                   Laurie Leslie Lillie Liz Megan Melanie Michele Monica
                   Natalie Renee Rosemary Shannon Sheila Sherry Stacey Sue
                   Suzanne Tamara Tara Terri Tiffany Tracy Valerie Vanessa
                   Jessica Ashley Sara Sarah Emily Taylor Stephanie Nicole
                   Rachel Kayla Courtney Hannah Rebecca Jasmine Kelsey Alyssa
                   Morgan Alexis Christina Veronica Victoria Vivian ]

  }
      
  # These attributes are initialized by calling the corresponding lambda
  ComplexAttributes =  {
    address_1: lambda do
      names = %w[ Oak Pine Maple Cedar Elm View Washington Lake Hill Walnut
                  Willow Peachtree Mountain Smith Spring North Ridge Lincoln
                  Church Willow Mill Sunset Railroad Jackson Cherry West South
                  Center Highland Johnson Forest Jefferson Hickory Wilson River
                  Meadow Valley Smith East Chestnut ]

      types = %w[ Road Court Street Avenue Lane Drive Parkway Highway]

      [rand(100...6999), names.sample, types.sample].join ' '
    end,
          
    address_2: lambda { "Apt. #{rand(1000...9999)}" },   

    zip: lambda { rand(10000...99998).to_s },

    phone: lambda do
      [3...9, 2...9, 2...9, 3...9, 2...9, 2...9, 1000...9999].map do |r|
        rand(r).to_s
      end.join
    end,

    email: lambda { "TB9TEST#{rand(000010...9999999)}@foo.com"  }
  }

  # constructor
  def initialize

    # first, the random stuff
    @data = Hash[ SimpleAttributes.map { |k,v| [k, v.sample] } +
                  ComplexAttributes.map { |k,v| [k, v.() ] } ]

    # then the derived stuff
    @data[:gender_long] = Genders[@data[:gender_short]]
    @data[:state_full] = States[@data[:state_short]]    
    if @data[:gender_short] == 'F'
      @data[:first_name] = @data[:girl_name]
    else
      @data[:first_name] = @data[:boy_name]
    end
    

   
  end

  def method_missing(name, *args, &block)
    # pass along any methods we don't recognize to our contained Hash;
    # if it doesn't understand them either, then treat them as keys
    if @data.respond_to? name then
      @data.send(name, *args, &block)
    elsif name.to_s =~ /=$/ then
      @data[name.to_s.sub(/=$/, '').intern] = args.first
    elsif @data.include? name then
      @data[name]
    end
  end
end


