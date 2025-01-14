ngOnInit(): void {
  this.loadCartItems();
}

loadCartItems(): void {
  const userId = localStorage.getItem('userId'); // Fetch userId from localStorage
  if (!userId) {
    alert("No data in cart");
    return;
  }

  this.service.getCartData(userId).subscribe(
    (items: Model[]) => {
      this.cartItems = items;
      this.calculateTotal();
    },
    () => alert("Failed to load cart items")
  );
}

getCardDetails(id: number): void {
  const userId = localStorage.getItem('userId'); // Fetch userId from localStorage
  if (!userId) {
    alert("No user logged in");
    return;
  }

  this.service.getAddToCart(id).subscribe(
    (res: any) => {
      if (res.userId !== userId) {
        alert("No items in cart for this user");
      } else {
        this.loadCartItems(); // Reload cart items if userId matches
      }
    },
    () => alert("Failed to get item details")
  );
}

calculateTotal(): void {
  this.total = this.cartItems.reduce((sum, item) => sum + item.price, 0);
}
