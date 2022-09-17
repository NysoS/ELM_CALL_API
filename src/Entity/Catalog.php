<?php

namespace App\Entity;

use ApiPlatform\Metadata\ApiResource;
use App\Repository\CatalogRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CatalogRepository::class)]
#[ApiResource]
class Catalog
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 25)]
    private ?string $name = null;

    #[ORM\OneToMany(mappedBy: 'catalog', targetEntity: Category::class)]
    private Collection $Categories;

    public function __construct()
    {
        $this->Categories = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection<int, Category>
     */
    public function getCategories(): Collection
    {
        return $this->Categories;
    }

    public function addCategory(Category $category): self
    {
        if (!$this->Categories->contains($category)) {
            $this->Categories->add($category);
            $category->setCatalog($this);
        }

        return $this;
    }

    public function removeCategory(Category $category): self
    {
        if ($this->Categories->removeElement($category)) {
            // set the owning side to null (unless already changed)
            if ($category->getCatalog() === $this) {
                $category->setCatalog(null);
            }
        }

        return $this;
    }
}
