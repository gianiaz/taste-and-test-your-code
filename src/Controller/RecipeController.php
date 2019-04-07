<?php
declare(strict_types=1);

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

/**
 * @Route("/recipes")
 */
class RecipeController
{



    /**
     * @Route("/", name="recipes-list")
     * @Template("recipes/list.html.twig")
     */
    public function list() {

        return ['prova' => 'test'];
    }

}
