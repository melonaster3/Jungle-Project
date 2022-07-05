describe('Product Details Page', () => {

    beforeEach(() => {
      cy.visit('/');
    })
  
    it("Has products on the page", () => {
      cy.get(".products article").should("be.visible");
    });
  
    it("Has 2 products on the page", () => {
      cy.get(".products article").should("have.length", 2);
    });
    
    it("It can navigate to the product details from the home page by clicking on the certain product", () => {
  
    cy.get("div > article:nth-child(1)").click();
  
    cy.get('.quantity').should("contain", "18 in stock")
  
    });
  
  })