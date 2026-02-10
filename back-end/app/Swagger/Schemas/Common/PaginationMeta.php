<?php

namespace App\Swagger\Schemas\Common;

use OpenApi\Attributes as OA;

#[OA\Schema(
	schema: 'PaginationMeta',
	properties: [
		new OA\Property(property: 'current_page', type: 'integer'),
		new OA\Property(property: 'last_page', type: 'integer'),
		new OA\Property(property: 'per_page', type: 'integer'),
		new OA\Property(property: 'total', type: 'integer'),
	],
	type: 'object'
)]
class PaginationMeta
{

}