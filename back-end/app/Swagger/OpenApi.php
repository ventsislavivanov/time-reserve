<?php

namespace App\Swagger;

use OpenApi\Attributes as OA;

#[OA\Info(
	version: "1.0.0",
	title: "My API Documentation"
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