function fn() {
    var env = karate.env;
    if (!env) {
        env = 'test';
    }


    var config = {

		petId:'55',
		FindByStatus: 'pending',
		petStatusFormData:'sold',
		petNameFormData:'dinazor',
        baseUrl: 'https://petstore.swagger.io/v2/',
        petImagePath: '../images/imageForRequest.png'
    }
       karate.configure('connectTimeout', 25000);
       karate.configure('readTimeout', 25000);
    return config;
}