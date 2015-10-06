# Behat-contexts-example
Example of using Behat contexts and testing API with cURL  

To use another context, first we initialize it in FeatureContext.php: 

    public function __construct(array $parameters)
    {
        //Initialize your context here
		$this->useContext('ApiContext', new ApiContext($parameters));  // context for api tests - ApiContext.php
    }

Then we can access FeatureContext methods and variables from inside ApiContext.php by using:

  $this->getMainContext()->methodName($args);
  $this->getMainContext()->test_variable;

And we can also access ApiContext methods and variables from inside FeatureContext.php like this:

 $this->getMainContext()->getSubcontext('ApiContext')->methodName($args);
 $this->getMainContext()->getSubcontext('ApiContext')->test_variable;


