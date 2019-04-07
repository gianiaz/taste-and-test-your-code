<?php
declare(strict_types=1);

namespace App\Controller;

use App\Entity\IngredientCategory;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

/**
 * @Route("/ingredients-category")
 */
class IngredientCategoryController
{

    /** @var EntityManagerInterface */
    private $em;

    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    /**
     * @Route("/", name="ingredients-category-list")
     * @Template("ingredients-category/list.html.twig")
     */
    public function listAction(): array {


        $categories = $this->em->getRepository(IngredientCategory::class)->findBy(['deletedAt' => null]);

        return ['categories' => $categories];
    }

    /**
     * @Route("/edit/{$category}", name="ingredients-category-edit")
     * @Route("/new", name="ingredients-category-new")
     * @Template("ingredients-category/list.html.twig")
     */
    public function newAction(Request $request) {



    }

}
