<?php
/**
 * Created by PhpStorm.
 * User: chriton
 * Date: 01.07.2015
 * Time: 17:15
 *
 * Access methods and variables of the FeatureContext class (including mink methods) from insisde ApiContext.php:
 * $this->getMainContext()->visit('/');
 * $this->getMainContext()->variabila_test;
 *
 * Access methods and variables of the ApiContext class from insisde FeatureContext.php:
 * $this->getMainContext()->getSubcontext('ApiContext')->method();
 * $this->getMainContext()->getSubcontext('ApiContext')->variabila_test;
 *
 * Note that PhpStorm will not recognise the methods or variables and will raise a warning, but it will work:
 * Method 'visit' not found in class ...
 * Field 'variabila_test' not found in class...
 */


use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;

use Behat\MinkExtension\Context\MinkContext;

//
// Require 3rd-party libraries here:
//
//   require_once 'PHPUnit/Autoload.php';
//   require_once 'PHPUnit/Framework/Assert/Functions.php';
//

/**
 * Features context.
 */
class FeatureContext extends MinkContext
{
    /**
     * Initializes context.
     * Every scenario gets its own context object.
     *
     * @param array $parameters context parameters (set them up through behat.yml)
     */

    public function __construct(array $parameters)
    {
        //Initialize your context here
		$this->useContext('ApiContext', new ApiContext($parameters));  // context for api tests - ApiContext.php
    }

}
