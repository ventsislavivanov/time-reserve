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
#[OA\Schema(
	schema: 'Timestamps',
	properties: [
		new OA\Property(property: 'created_at', type: 'string', format: 'date-time'),
		new OA\Property(property: 'updated_at', type: 'string', format: 'date-time'),
	]
)]
class OpenApi
{

}