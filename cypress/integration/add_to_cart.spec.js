describe('add-cart', () => {

    beforeEach(() => {
      cy.visit('/');
    })
  
    it("Has products on the page", () => {
      cy.get(".products article").should("be.visible");
    });
  
    it("Has 2 products on the page", () => {
      cy.get(".products article").should("have.length", 2);
    });
  
    it("changes cart count when add button is clicked", () => {
      cy.contains("li.nav-item.end-0 > a", "My Cart (0)")
      cy.get(':nth-child(1) > div > .button_to > .btn').click({ force: true });
      cy.contains("li.nav-item.end-0 > a", "My Cart (1)")
    })
  
  })