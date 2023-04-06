<?php
namespace App\Entity;
use App\Repository\OrdersRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: OrdersRepository::class)]
class Orders
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?int $quantity = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $items = null;

    #[ORM\Column(length: 255)]
    private ?string $total_price = null;

    #[ORM\Column(length: 255)]
    private ?string $customer = null;

    #[ORM\ManyToMany(targetEntity: Dish::class, inversedBy: 'Orders')]
    private Collection $Dishes;

    public function __construct()
    {
        $this->Dishes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getQuantity(): ?int
    {
        return $this->quantity;
    }

    public function setQuantity(int $quantity): self
    {
        $this->quantity = $quantity;

        return $this;
    }

    public function getItems(): ?string
    {
        return $this->items;
    }

    public function setItems(string $items): self
    {
        $this->items = $items;

        return $this;
    }

    public function getTotalPrice(): ?string
    {
        return $this->total_price;
    }

    public function setTotalPrice(string $total_price): self
    {
        $this->total_price = $total_price;

        return $this;
    }

    public function getCustomer(): ?string
    {
        return $this->customer;
    }

    public function setCustomer(string $customer): self
    {
        $this->customer = $customer;

        return $this;
    }

    /**
     * @return Collection<int, Dish>
     */
    public function getDishes(): Collection
    {
        return $this->Dishes;
    }

    public function addDish(Dish $dish): self
    {
        if (!$this->Dishes->contains($dish)) {
            $this->Dishes->add($dish);
        }

        return $this;
    }

    public function removeDish(Dish $dish): self
    {
        $this->Dishes->removeElement($dish);

        return $this;
    }
}
?>