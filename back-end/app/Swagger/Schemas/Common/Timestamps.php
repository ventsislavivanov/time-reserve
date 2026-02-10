<?php

namespace App\Swagger\Schemas\Common;

use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'Timestamps',
	properties: [
		new OA\Property(property: 'created_at', type: 'string', format: 'date-time'),
		new OA\Property(property: 'updated_at', type: 'string', format: 'date-time'),
	],
	type: 'object'
)]
class Timestamps
{

}