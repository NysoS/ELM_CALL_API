<?php

namespace App\DataFixtures;

use App\Entity\Catalog;
use App\Entity\Category;
use App\Entity\Product;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $catalog = New Catalog();
        $catalog->setName("Catalog_1");
        $manager->persist($catalog);

        //-------------------------------//
        $category1 = new Category();
        $category1->setName("Food")
            ->setCatalog($catalog);
        $manager->persist($category1);

        $category2 = new Category();
        $category2->setName("Books/CD")
            ->setCatalog($catalog);
        $manager->persist($category2);

        $category3 = new Category();
        $category3->setName("Gaming")
            ->setCatalog($catalog);
        $manager->persist($category3);

        //----------------------------------------//

        $product1 = new Product();
        $product1->setName("Harry Potter")
            ->setDescription("Is a book")
            ->setPrice(12.5)
            ->setStateStock(true)
            ->setCategory($category2);
        $manager->persist($product1);

        $product2 = new Product();
        $product2->setName("Logitech G pro X")
            ->setDescription("Gaming headphone")
            ->setPrice(85)
            ->setStateStock(true)
            ->setCategory($category3);
        $manager->persist($product2);

        $product3 = new Product();
        $product3->setName("Logitech G403 Hero")
            ->setDescription("Gaming mouse")
            ->setPrice(75)
            ->setStateStock(true)
            ->setCategory($category3);
        $manager->persist($product3);

        $product4 = new Product();
        $product4->setName("Pizza")
            ->setDescription("Pizza")
            ->setPrice(12)
            ->setStateStock(true)
            ->setCategory($category1);
        $manager->persist($product4);

        $product5 = new Product();
        $product5->setName("Steak cow")
            ->setDescription("Steak")
            ->setPrice(4.35)
            ->setStateStock(false)
            ->setCategory($category1);
        $manager->persist($product5);

        //---------------------------------------------//

        $manager->flush();
    }
}
