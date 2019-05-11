<?php
declare(strict_types=1);

namespace App\Controller;

use App\Entity\IngredientCategory;
use App\Form\IngredientCategoryType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\FormFactoryInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Session\Flash\FlashBagInterface;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\Routing\RouterInterface;

/**
 * @Route("/ingredients-category")
 */
class IngredientCategoryController
{

    /** @var EntityManagerInterface */
    private $em;

    /** @var FormFactoryInterface */
    private $formFactory;

    /** @var FlashBagInterface */
    private $flashBag;
    /** @var RouterInterface */
    private $router;

    public function __construct(
        EntityManagerInterface $em,
        FormFactoryInterface $formFactory,
        FlashBagInterface $flashBag,
    RouterInterface $router
    )
    {
        $this->em = $em;
        $this->formFactory = $formFactory;
        $this->flashBag = $flashBag;
        $this->router = $router;
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
     * @Route("/delete/{category}", name="ingredients-category-delete")
     */
    public function deleteAction(IngredientCategory $category) {

        $category->setDeletedAt(new \DateTime());

        $this->em->persist($category);

        $this->em->flush();

        return new RedirectResponse($this->router->generate('ingredients-category-list'));


    }

    /**
     * @Route("/edit/{category}", name="ingredients-category-edit")
     * @Route("/new", name="ingredients-category-new")
     * @Template("ingredients-category/form.html.twig")
     */
    public function newAction(Request $request) {

        $category = new IngredientCategory();

        if($request->get('category')) {
            $entityRepostory = $this->em->getRepository(IngredientCategory::class);

            $category = $entityRepostory->find($request->get('category'));
        }

        $form = $this->formFactory->create(IngredientCategoryType::class, $category);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            $this->em->persist($category);
            $this->em->flush();

            $this->flashBag->set('success', 'Salvataggio avvenuto con successo');

            return new RedirectResponse($this->router->generate('ingredients-category-list'));
        }

         return ['form' => $form->createView()];

    }

}
