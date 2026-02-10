<?php

namespace App\Swagger;

use OpenApi\Attributes as OA;

#[OA\Info(
	version: "1.0.0",
	title: "My API Documentation"
)]
#[OA\Server(
	url: "http://10.66.4.47:8989",
	description: "Local development server"
)]
#[OA\SecurityScheme(
	securityScheme: "sanctum",
	type: "http",
	bearerFormat: "JWT",
	scheme: "bearer"
)]
class OpenApi
{

}