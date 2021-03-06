insert into COLORIS(PICTO) values ("");
insert into COLORIS_FR values (1,"Rouge");
insert into COLORIS_EN values (1,"Red");
insert into COLORIS(PICTO) values ("");
insert into COLORIS_FR values (2,"Noir");
insert into COLORIS_EN values (2,"Black");

insert into PAYS values ();
insert into PAYS_FR values (1,"France");
insert into PAYS_EN values (1,"French");
insert into PAYS values ();
insert into PAYS_FR values (2,"Etats-Unis");
insert into PAYS_EN values (2,"USA");

insert into SPECIFICITE_PRODUIT values ();
insert into SPECIFICITE_PRODUIT_FR values (1,"Promo", "P");
insert into SPECIFICITE_PRODUIT_EN values (1,"Discount", "D");
insert into SPECIFICITE_PRODUIT values ();
insert into SPECIFICITE_PRODUIT_FR values (2,"Coup de coeur", "C");
insert into SPECIFICITE_PRODUIT_EN values (2,"Heart hit", "H");

insert into DESIGNER(nom, prenom) values ("Dubar","Raf-designer");
insert into EDITEUR(nom, prenom) values ("Dubar","Raf-Editeur");

insert into PRODUIT(payid, desid, ediid, reference, visu_lang, quantite) values (1, 1, 1, "ref0123456789", 3, 10);
insert into PRODUIT_FR(proid, nom, information, description, materiaux, poids, hauteur, largeur, profondeur, diametre, desc_annee, signe_apparent, prixachat, dispo_loc ) values (1, "nom1", "information1", "desc1", "materiaux1", "poids1", "hauteur1", "largeur1", "profondeur1", "diametre1", "descAnn�e1", "signe1", 245.0, 1);
insert into PRODUIT_EN(proid, nom, information, description, materiaux, poids, hauteur, largeur, profondeur, diametre, desc_annee, signe_apparent, prixachat, dispo_loc ) values (1, "nom1 EN", "information1 EN", "desc1", "materiaux1", "poids1", "hauteur1", "largeur1", "profondeur1", "diametre1", "descAnn�e1", "signe1", 245.0, 1);

insert into PRODUIT(payid, desid, ediid, reference, visu_lang, quantite) values (1, 1, 1, "ref9876543210", 3, 10);
insert into PRODUIT_FR(proid, nom, information, description, materiaux, poids, hauteur, largeur, profondeur, diametre, desc_annee, signe_apparent, prixachat, dispo_loc ) values (2, "nom2", "information2", "desc2", "materiaux2", "poids2", "hauteur2", "largeur2", "profondeur2", "diametre2", "descAnn�e2", "signe2", 150.95, 1);
insert into PRODUIT_EN(proid, nom, information, description, materiaux, poids, hauteur, largeur, profondeur, diametre, desc_annee, signe_apparent, prixachat, dispo_loc ) values (2, "nom2 EN", "information2 EN", "desc2", "materiaux2", "poids2", "hauteur2", "largeur2", "profondeur2", "diametre2", "descAnn�e2", "signe2", 150.95, 1);

insert into IMAGE_PRODUIT(proid, pathphoto, pathvignette) values (1, "resources/img/picto_site/1.jpg","resources/img/picto_site/1.jpg");
insert into IMAGE_PRODUIT(proid, pathphoto, pathvignette) values (1, "resources/img/picto_site/6.jpg","resources/img/picto_site/6.jpg");
insert into IMAGE_PRODUIT(proid, pathphoto, pathvignette) values (2, "resources/img/picto_site/3.jpg","resources/img/picto_site/3.jpg");
insert into IMAGE_PRODUIT(proid, pathphoto, pathvignette) values (2, "resources/img/picto_site/4.jpg","resources/img/picto_site/4.jpg");

insert into PRODUIT_COLORIS values (1, 1);
insert into PRODUIT_COLORIS values (1, 2);
insert into PRODUIT_COLORIS values (2, 1);

insert into PRODUIT_SPECIFICITE values (1, 1);
insert into PRODUIT_SPECIFICITE values (1, 2);
insert into PRODUIT_SPECIFICITE values (2, 1);

insert into RUBRIQUE_PRODUIT values(1,1);
insert into RUBRIQUE_PRODUIT values(1,2);