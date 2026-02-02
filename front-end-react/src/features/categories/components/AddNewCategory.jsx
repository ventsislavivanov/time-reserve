import { useEffect } from "react";
import { UIAppForm, UIButton, UICard, UIInput } from '../../../components/common/ui';
import { categoryRules } from "../validations/categoryRules.js";
import { useAppForm } from '../../../hooks';

const AddNewCategory = ({
	isEditing,
	category,
	onSubmit,
	onCancel
}) => {
	const methods = useAppForm({
		defaultValues: category,
	});

	const {
		isLoading,
		reset
	} = methods;

	useEffect(() => {
		reset(category);
	}, [category, reset]);

	const rules  = categoryRules();

	return (
		<UICard
			variant="primary"
			title={isEditing ? 'Edit Category' : 'Add New Category'}
			headerIcon={isEditing ? 'edit' : 'plus-circle'}
		>
			<UIAppForm methods={methods} onSubmit={onSubmit}>
				<UIInput
					name="name"
					label="Name"
					placeholder="e.g. Job position"
					rules={rules.name}
				/>

				<div className="d-grid gap-2">
					<UIButton
						type="submit"
						variant="success"
						isLoading={isLoading}
					>
						{isEditing ? 'Update category' : 'Save category'}
					</UIButton>

					{isEditing && (
						<UIButton
							variant="outline-secondary"
							type="button"
							isLoading={isLoading}
							onClick={onCancel}
						>
							Cancel
						</UIButton>
					)}
				</div>
			</UIAppForm>
		</UICard>
	);
};

export default AddNewCategory;
