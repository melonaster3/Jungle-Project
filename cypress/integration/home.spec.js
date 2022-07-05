describe ('Home page', () => {
    
    beforeEach(() => {
        cy.visit('/');
    })

    it("Has Products on page", () => {
        cy.get(".products article").should("be.visible");
    });

    it("Has 2 products on page", () => {
        cy.get(".products article").should("have.length",2)
    });
})