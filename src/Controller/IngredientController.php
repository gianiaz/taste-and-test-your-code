<?php
declare(strict_types=1);

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

/**
 * @Route("/ingredients")
 */
class IngredientController
{

    /**
     * @Route("/", name="ingredients-list")
     * @Template("ingredients/list.html.twig")
     */
    public function list() {

        return ['prova' => 'test'];
    }

}
