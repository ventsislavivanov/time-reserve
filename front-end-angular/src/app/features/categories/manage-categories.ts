import { Component, inject, OnInit, signal } from '@angular/core';
import { CategoriesResponse, Category } from './categories.model';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { faEdit, faTrash } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { CategoriesService } from './categories.service';
import { FormField } from '../../shared/components';


@Component({
  selector: 'manage-categories',
  imports: [FormField, ReactiveFormsModule, FontAwesomeModule],
  templateUrl: './manage-categories.html',
})
export class ManageCategories implements OnInit {
  faEdit = faEdit;
  faTrash = faTrash;

  private fb = inject(FormBuilder);
  private categoriesService = inject(CategoriesService);

  categories = signal<Category[]>([]);
  currentId = signal<number | null>(null);
  isEditing  = signal<boolean>(false);
  isLoading = signal<boolean>(true);
  error = signal<string | null>(null);

  categoryForm: FormGroup = this.fb.group({
    name: ['', [Validators.required]],
  });

  ngOnInit() {
    this.loadCategories()
  }

  loadCategories() {
    this.isLoading.set(true);

    this.categoriesService.getAll().subscribe({
      next: (response: CategoriesResponse) => {
        this.categories.set(response.data);
      },
      error: (err) => {
        this.error.set(err.message);
      },
      complete: () => {
        this.isLoading.set(false);
      },
    });
  }

  onSubmit() {
    if (this.categoryForm.invalid) return;

    const data = this.categoryForm.value;
    const id = this.currentId(); //

    if (this.isEditing() && id !== null) {
      this.categoriesService.update(id, data).subscribe(() => {
        this.resetForm();
        this.loadCategories();
      });
    } else {
      this.categoriesService.create(data).subscribe(() => {
        this.resetForm();
        this.loadCategories();
      });
    }
  }

  onEdit(category: Category) {
    this.isEditing.set(true);
    this.currentId.set(category.id);
    this.categoryForm.patchValue({
      name: category.name
    });
  }

  onDelete(id: number) {
    if (confirm('Сигурни ли сте, че искате да изтриете тази категория?')) {
      this.categoriesService.remove(id).subscribe(() => {
        this.loadCategories();
      });
    }
  }

  resetForm() {
    this.isEditing.set(false);
    this.currentId.set(null);
    this.categoryForm.reset();
  }

  get nameErrors() {
    const control = this.categoryForm.get('name');
    if (control?.touched && control.invalid) {
      return Object.keys(control.errors || {}).map((key, i) => ({
        $uid: i,
        $message: this.getErrorMessage(key, control.errors?.[key])
      }));
    }

    return [];
  }

  private getErrorMessage(errorKey: string, errorValue: any): string {
    const messages: any = {
      required: 'This field is required',
    };

    return messages[errorKey] || 'Invalid field';
  }
}
