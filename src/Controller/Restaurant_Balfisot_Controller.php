<?php
namespace App\Controller;
use App\Entity\Categories;
use App\Entity\Dish;
use App\Entity\Orders;
use App\Form\OrderFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

class Restaurant_Balfisot_Controller extends AbstractController
{
    #[Route('/Categories', name: 'Categories')]
    public function categories(EntityManagerInterface $entityManager, int $id = null): Response
    {
        if ($id !== null) {
            $categories = $entityManager->getRepository(Categories::class)->find($id);
        } else {
            $categories = $entityManager->getRepository(Categories::class)->findAll();
        }
        return $this->render('Restaurant_Balfisot_Categories.html.twig', ['categories' => $categories]);
    }

    #[Route('/Register', name: 'Register')]
    public function register(): Response
    {
        return $this->render('Restaurant_Balfisot_Register.html.twig');
    }

    #[Route('/Profile', name: 'Profile')]
    public function profile(): Response
    {
        return $this->render('Restaurant_Balfisot_Profile.html.twig');
    }

    #[Route('/Home', name: 'Home')]
    public function home(): Response
    {
        return $this->render('Restaurant_Balfisot_Home.html.twig');
    }

    #[Route('/Order', name: 'Order')]
    public function order(Request $request, EntityManagerInterface $entityManager, int $id = null): Response
    {
        if ($id !== null) {
            $categories = $entityManager->getRepository(Categories::class)->find($id);
        } else {
            $categories = $entityManager->getRepository(Categories::class)->findAll();
        }

        $categoryDishes = [];

        foreach ($categories as $category) {
            $categoryDishes[$category->getId()] = $entityManager->createQueryBuilder()
                ->select('d')
                ->from(Dish::class, 'd')
                ->where('d.category = :category')
                ->setParameter('category', $category)
                ->getQuery()
                ->getResult();
        }

        $order = new Orders();
        $form = $this->createForm(OrderFormType::class, $order, [
            'categories' => $categories,
            'dishes' => $categoryDishes,
        ]);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($order);
            $entityManager->flush();
            $this->addFlash('success', 'Your order has been placed successfully!');
        }
        return $this->render('Restaurant_Balfisot_Order.html.twig', ['OrderForm' => $form, 'categories' => $categories,  'categoryDishes' => $categoryDishes,]);
    }



    #[Route('/Orders', name: 'Orders')]
    public function orders(): Response
    {
        return $this->render('Restaurant_Balfisot_Orders.html.twig');
    }

    #[Route('/Contact', name: 'Contact')]
    public function contact(): Response
    {
        return $this->render('Restaurant_Balfisot_Contact.html.twig');
    }

    #[Route('/About_Us', name: 'About Us')]
    public function about_us(): Response
    {
        return $this->render('Restaurant_Balfisot_About_Us.html.twig');
    }


    #[Route('/Appetizers', name: 'Appetizers')]
    public function appetizers(EntityManagerInterface $entityManager, int $id = null): Response
    {
        $appetizerIds = [1, 2, 3, 4, 5];
        $queryBuilder = $entityManager->createQueryBuilder();
        $queryBuilder->select('d')
            ->from(Dish::class, 'd')
            ->where($queryBuilder->expr()->in('d.id', $appetizerIds))
            ->orderBy('d.id', 'ASC');
        $appetizers = $queryBuilder->getQuery()->getResult();

        return $this->render('Restaurant_Balfisot_Appetizers.html.twig', ['appetizers' => $appetizers]);
    }

    #[Route('/Main_Course', name: 'Main Course')]
    public function main_course(EntityManagerInterface $entityManager, int $id = null): Response
    {
        $maincourseIds = [6, 7, 8, 9, 10];
        $queryBuilder = $entityManager->createQueryBuilder();
        $queryBuilder->select('d')
            ->from(Dish::class, 'd')
            ->where($queryBuilder->expr()->in('d.id', $maincourseIds))
            ->orderBy('d.id', 'ASC');
        $maincourse = $queryBuilder->getQuery()->getResult();

        return $this->render('Restaurant_Balfisot_Main_Course.html.twig', ['mainCourse' => $maincourse]);
    }

    #[Route('/Desserts', name: 'Desserts')]
    public function desserts(EntityManagerInterface $entityManager, int $id = null): Response
    {
        $dessertsIds = [11, 12, 13, 14, 15];
        $queryBuilder = $entityManager->createQueryBuilder();
        $queryBuilder->select('d')
            ->from(Dish::class, 'd')
            ->where($queryBuilder->expr()->in('d.id', $dessertsIds))
            ->orderBy('d.id', 'ASC');
          $desserts = $queryBuilder->getQuery()->getResult();

          return $this->render('Restaurant_Balfisot_Desserts.html.twig', ['desserts' => $desserts]);
    }

    #[Route('/Snacks', name: 'Snacks')]
    public function snacks(EntityManagerInterface $entityManager, int $id = null): Response
    {
        $snacksds = [21, 22, 23, 24, 25];
        $queryBuilder = $entityManager->createQueryBuilder();
        $queryBuilder->select('d')
            ->from(Dish::class, 'd')
            ->where($queryBuilder->expr()->in('d.id', $snacksds))
            ->orderBy('d.id', 'ASC');
        $snacks= $queryBuilder->getQuery()->getResult();

        return $this->render('Restaurant_Balfisot_Snacks.html.twig', ['snacks' => $snacks]);
    }

    #[Route('/Breakfast', name: 'Breakfast')]
    public function breakfast(EntityManagerInterface $entityManager, int $id = null): Response
    {
  
        $breakfastIds = [16, 17, 18, 19, 20];
        $queryBuilder = $entityManager->createQueryBuilder();
        $queryBuilder->select('d')
            ->from(Dish::class, 'd')
            ->where($queryBuilder->expr()->in('d.id', $breakfastIds))
            ->orderBy('d.id', 'ASC');
        $breakfast= $queryBuilder->getQuery()->getResult();

        return $this->render('Restaurant_Balfisot_Breakfast.html.twig', ['breakfast' => $breakfast]);
    }

    #[Route('/Drinks', name: 'Drinks')]
    public function drinks(EntityManagerInterface $entityManager, int $id = null): Response
    {
        $drinksIds = [26, 27, 28, 29, 30];
        $queryBuilder = $entityManager->createQueryBuilder();
        $queryBuilder->select('d')
            ->from(Dish::class, 'd')
            ->where($queryBuilder->expr()->in('d.id', $drinksIds))
            ->orderBy('d.id', 'ASC');
        $drinks= $queryBuilder->getQuery()->getResult();

        return $this->render('Restaurant_Balfisot_Drinks.html.twig', ['drinks' => $drinks]);
    }
}
?>
